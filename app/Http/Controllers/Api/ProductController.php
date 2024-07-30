<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductProperty;
use App\Models\Property;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $filters = $request->only(['properties']);

        $query = Product::query();

        if (isset($filters['properties'])) {
            foreach ($filters['properties'] as $propertyName => $propertyValues) {
                $query->whereHas('properties', function ($q) use ($propertyName, $propertyValues) {
                    $q->where('name', $propertyName)
                        ->whereIn('value', $propertyValues);
                });
            }
        }

        $products = $query->paginate(40);
        if ($products->isEmpty()) {
            return response()->json(['message' => 'Ничего не найдено'], 404);
        }
        return response()->json($products);
    }

    public function create()
    {
        $data = [];

        for ($i = 0; $i < 40; $i++) {
            $data[] = [
                'name' => 'Товар ' . ($i + 1),
                'price' => rand(10, 100),
                'quantity' => rand(1, 100),
                'properties' => [
                    ['name' => 'Цвет', 'value' => ['Красный', 'Синий', 'Зеленый', 'Желтый'][array_rand(['Красный', 'Синий', 'Зеленый', 'Желтый'])]],
                    ['name' => 'Размер', 'value' => ['Малый', 'Средний', 'Большой'][array_rand(['Малый', 'Средний', 'Большой'])]],
                    ['name' => 'Бренд', 'value' => ['BrandA', 'BrandB', 'BrandC'][array_rand(['BrandA', 'BrandB', 'BrandC'])]],
                ],
            ];
        }

        foreach ($data as $item) {
            // Создаем новый товар
            $product = Products::create([
                'name' => $item['name'],
                'price' => $item['price'],
                'quantity' => $item['quantity'],
            ]);

            // Проходим по свойствам товара
            foreach ($item['properties'] as $propertyData) {
                // Находим или создаем свойство
                $property = Property::firstOrCreate(['name' => $propertyData['name']]);

                // Создаем запись в промежуточной таблице
                ProductProperty::create([
                    'product_id' => $product->id,
                    'property_id' => $property->id,
                    'value' => $propertyData['value'],
                ]);
            }
        }
        return "Ок!";
    }
}
