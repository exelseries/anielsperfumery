<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class GoogleDriveProductsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $now = Carbon::now();
        $sourceImageDir = storage_path('app/public/imported_products');

        if (! File::exists($sourceImageDir)) {
            $this->command->error("Source image directory [{$sourceImageDir}] does not exist.");

            return;
        }

        // 1. Create or retrieve luxury categories under Root (parent_id: 1)
        $categoriesData = [
            [
                'name' => 'Extrait de Parfum',
                'slug' => 'extrait-de-parfum',
                'description' => 'Highest concentration luxury extraits crafted for long-lasting sillage.',
            ],
            [
                'name' => 'Eau de Parfum',
                'slug' => 'eau-de-parfum',
                'description' => 'Sophisticated eau de parfums for daily elegance and signature presence.',
            ],
            [
                'name' => 'Private Reserve Oud',
                'slug' => 'private-reserve-oud',
                'description' => 'Rare Cambodian and Assam agarwood elixirs for connoisseurs of regal oud.',
            ],
            [
                'name' => 'Bespoke Fragrances',
                'slug' => 'bespoke-fragrances',
                'description' => 'Masterfully blended artisan creations inspired by royal Nigerian heritage.',
            ],
        ];

        $categoryIds = [];
        foreach ($categoriesData as $index => $cat) {
            $existingCat = DB::table('category_translations')->where('slug', $cat['slug'])->first();

            if (! $existingCat) {
                $catId = DB::table('categories')->insertGetId([
                    'position' => $index + 1,
                    'status' => 1,
                    'display_mode' => 'products_and_description',
                    'parent_id' => 1,
                    '_lft' => ($index * 2) + 2,
                    '_rgt' => ($index * 2) + 3,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);

                foreach (['en', 'fr', 'es', 'de', 'ar'] as $locale) {
                    DB::table('category_translations')->insert([
                        'category_id' => $catId,
                        'locale' => $locale,
                        'name' => $cat['name'],
                        'slug' => $cat['slug'],
                        'description' => $cat['description'],
                        'meta_title' => $cat['name'].' — Aniel\'s Perfumery',
                        'meta_keywords' => 'perfume, fragrance, luxury, oud, Nigeria',
                        'meta_description' => $cat['description'],
                    ]);
                }
            } else {
                $catId = $existingCat->category_id;
            }

            $categoryIds[$cat['slug']] = $catId;
        }

        // 2. Define 25 Google Drive perfume products
        $productsList = [
            [
                'image' => 'IMG_3785.jpg',
                'sku' => 'ANIELS-3785',
                'name' => 'Aniel\'s Royal Oud Extrait',
                'category' => 'private-reserve-oud',
                'price' => 185000,
                'description' => 'An opulent fusion of rare Cambodian Oud, warm amber, and golden rose.',
                'top' => 'Cambodian Oud, Bergamot',
                'middle' => 'Damask Rose, Amber',
                'base' => 'Sandalwood, Royal Musk',
            ],
            [
                'image' => 'IMG_3786.jpg',
                'sku' => 'ANIELS-3786',
                'name' => 'Sovereign Amber & Leather',
                'category' => 'bespoke-fragrances',
                'price' => 145000,
                'description' => 'A commanding blend of Tuscan leather, spicy cardamom, and rich Baltic amber.',
                'top' => 'Cardamom, Pink Pepper',
                'middle' => 'Tuscan Leather, Orris',
                'base' => 'Amber, Cedarwood',
            ],
            [
                'image' => 'IMG_3788.jpg',
                'sku' => 'ANIELS-3788',
                'name' => 'Velvet Rose & Smoked Vanilla',
                'category' => 'extrait-de-parfum',
                'price' => 120000,
                'description' => 'Sensual Turkish rose enveloped in Madagascar bourbon vanilla and soft patchouli.',
                'top' => 'Turkish Rose, Red Saffron',
                'middle' => 'Bourbon Vanilla, Patchouli',
                'base' => 'Tonka Bean, Aged Oud',
            ],
            [
                'image' => 'IMG_3789.jpg',
                'sku' => 'ANIELS-3789',
                'name' => 'Imperial Citrus & Cedar',
                'category' => 'eau-de-parfum',
                'price' => 95000,
                'description' => 'Vibrant Italian bergamot balanced with crisp Atlas cedarwood and fresh vetiver.',
                'top' => 'Calabrian Bergamot, Lemon',
                'middle' => 'Atlas Cedarwood, Vetiver',
                'base' => 'White Musk, Oakmoss',
            ],
            [
                'image' => 'IMG_3790.jpg',
                'sku' => 'ANIELS-3790',
                'name' => 'Nectar de Seduction',
                'category' => 'bespoke-fragrances',
                'price' => 165000,
                'description' => 'An intoxicating bouquet of ripe peach, golden plum, tuberoses, and warm cinnamon.',
                'top' => 'Peach, Plum, Cinnamon',
                'middle' => 'Jasmine, Tuberose',
                'base' => 'Vanilla, Benzoin',
            ],
            [
                'image' => 'IMG_3791.jpg',
                'sku' => 'ANIELS-3791',
                'name' => 'Enugu Midnight Oud',
                'category' => 'private-reserve-oud',
                'price' => 220000,
                'description' => 'A mysterious, dark extrait crafted with smoked frankincense, dark rose, and royal agarwood.',
                'top' => 'Smoked Incense, Saffron',
                'middle' => 'Aged Agarwood, Taif Rose',
                'base' => 'Ambergris, Black Leather',
            ],
            [
                'image' => 'IMG_3792.jpg',
                'sku' => 'ANIELS-3792',
                'name' => 'Golden Sillage Extrait',
                'category' => 'extrait-de-parfum',
                'price' => 210000,
                'description' => 'Radiant golden nectar featuring wild honey, orange blossom, and cashmere woods.',
                'top' => 'Wild Honey, Orange Blossom',
                'middle' => 'Ylang-Ylang, Frankincense',
                'base' => 'Cashmere Wood, Bourbon Vanilla',
            ],
            [
                'image' => 'IMG_3793.jpg',
                'sku' => 'ANIELS-3793',
                'name' => 'Bespoke Cashmere & Iris',
                'category' => 'bespoke-fragrances',
                'price' => 135000,
                'description' => 'Powdery Italian iris combined with silky cashmere and warm labdanum resin.',
                'top' => 'Italian Iris, Violet Leaf',
                'middle' => 'Cashmeran, Cedar',
                'base' => 'Musk, Labdanum',
            ],
            [
                'image' => 'IMG_3795.jpg',
                'sku' => 'ANIELS-3795',
                'name' => 'Oud Absolute 1926',
                'category' => 'private-reserve-oud',
                'price' => 250000,
                'description' => 'The crown jewel of Aniel\'s. Rare Assam oud distillate with red saffron and dark tobacco.',
                'top' => 'Wild Saffron, Cardamom',
                'middle' => 'Royal Assam Oud, Myrrh',
                'base' => 'Pipe Tobacco, Sandalwood',
            ],
            [
                'image' => 'IMG_3796.jpg',
                'sku' => 'ANIELS-3796',
                'name' => 'Aura of Opulence',
                'category' => 'extrait-de-parfum',
                'price' => 150000,
                'description' => 'A sparkling scent opening with pink pepper and mandora, settling into velvet patchouli.',
                'top' => 'Mandora, Pink Pepper',
                'middle' => 'Lilac, Golden Patchouli',
                'base' => 'Crystal Amber, Musk',
            ],
            [
                'image' => 'IMG_3797.jpg',
                'sku' => 'ANIELS-3797',
                'name' => 'Celeste Floral Elixir',
                'category' => 'eau-de-parfum',
                'price' => 115000,
                'description' => 'Bright neroli and white gardenia petals dancing upon a bed of clean musk.',
                'top' => 'Neroli, Bergamot',
                'middle' => 'Jasmine Sambac, Gardenia',
                'base' => 'Cedarwood, White Musk',
            ],
            [
                'image' => 'IMG_3798.jpg',
                'sku' => 'ANIELS-3798',
                'name' => 'Noir Saphir Intense',
                'category' => 'bespoke-fragrances',
                'price' => 175000,
                'description' => 'Dramatic black currant and smoky birch tar woven with velvet rose petals.',
                'top' => 'Black Currant, Cypress',
                'middle' => 'Aged Oud, Dark Rose',
                'base' => 'Suede, Birch Tar',
            ],
            [
                'image' => 'IMG_3799.jpg',
                'sku' => 'ANIELS-3799',
                'name' => 'Soleil D\'Or Citrus',
                'category' => 'eau-de-parfum',
                'price' => 85000,
                'description' => 'Sun-kissed blood orange and mandarin paired with aromatic Haitian vetiver.',
                'top' => 'Blood Orange, Mandora',
                'middle' => 'Orange Blossom, Jasmine',
                'base' => 'Vetiver, Musk',
            ],
            [
                'image' => 'IMG_3800.jpg',
                'sku' => 'ANIELS-3800',
                'name' => 'Majestic Vetiver & Spices',
                'category' => 'eau-de-parfum',
                'price' => 130000,
                'description' => 'Smoky Haitian vetiver combined with freshly cracked nutmeg and warm benzoin.',
                'top' => 'Grapefruit, Nutmeg',
                'middle' => 'Haitian Vetiver, Black Pepper',
                'base' => 'Benzoin, Atlas Cedar',
            ],
            [
                'image' => 'IMG_3802.jpg',
                'sku' => 'ANIELS-3802',
                'name' => 'Elixir de Fleur Royal',
                'category' => 'extrait-de-parfum',
                'price' => 160000,
                'description' => 'Precious Damask rose and lychee resting on amberwood and golden peony.',
                'top' => 'Damask Rose, Lychee',
                'middle' => 'Peony, White Musk',
                'base' => 'Cedar, Amberwood',
            ],
            [
                'image' => 'IMG_3803.jpg',
                'sku' => 'ANIELS-3803',
                'name' => 'Imperial Leather & Smoke',
                'category' => 'bespoke-fragrances',
                'price' => 195000,
                'description' => 'Rich Russian leather accented with wild raspberries and frankincense smoke.',
                'top' => 'Tuscan Leather, Thyme',
                'middle' => 'Raspberry, Frankincense',
                'base' => 'Amber, Soft Suede',
            ],
            [
                'image' => 'IMG_3804.jpg',
                'sku' => 'ANIELS-3804',
                'name' => 'Oud Wood & Amber Sovereign',
                'category' => 'private-reserve-oud',
                'price' => 240000,
                'description' => 'Rare agarwood chips infused with rosewood, tonka beans, and liquid amber.',
                'top' => 'Rosewood, Cardamom',
                'middle' => 'Rare Oud, Sandalwood',
                'base' => 'Tonka Bean, Amber',
            ],
            [
                'image' => 'IMG_3805.jpg',
                'sku' => 'ANIELS-3805',
                'name' => 'Vanilla Bourbon Supreme',
                'category' => 'extrait-de-parfum',
                'price' => 140000,
                'description' => 'Pure Madagascar vanilla caviar with Ceylon cinnamon and roasted cacao nibs.',
                'top' => 'Madagascar Vanilla, Cinnamon',
                'middle' => 'Cacao Nibs, Tonka',
                'base' => 'Dry Woods, Amber Musk',
            ],
            [
                'image' => 'IMG_3806.jpg',
                'sku' => 'ANIELS-3806',
                'name' => 'Bespoke Saffron & Patchouli',
                'category' => 'bespoke-fragrances',
                'price' => 155000,
                'description' => 'A regal tapestry of red Kashmiri saffron, earthy patchouli, and grey ambergris.',
                'top' => 'Red Saffron, Nutmeg',
                'middle' => 'Patchouli, Cedarwood',
                'base' => 'Ambergris, Vintage Leather',
            ],
            [
                'image' => 'IMG_3808.jpg',
                'sku' => 'ANIELS-3808',
                'name' => 'Ambre Royale Intense',
                'category' => 'extrait-de-parfum',
                'price' => 170000,
                'description' => 'Deep golden amber infused with Italian bergamot, labdanum resin, and sweet benzoin.',
                'top' => 'Golden Amber, Bergamot',
                'middle' => 'Labdanum, Patchouli',
                'base' => 'Vanilla, Benzoin',
            ],
            [
                'image' => 'IMG_3809.jpg',
                'sku' => 'ANIELS-3809',
                'name' => 'Monarch Oud & Rose',
                'category' => 'private-reserve-oud',
                'price' => 230000,
                'description' => 'Noble Taif rose married with wild Cambodian oud and velvety Mysore sandalwood.',
                'top' => 'Taif Rose, Geranium',
                'middle' => 'Cambodian Oud, Saffron',
                'base' => 'Mysore Sandalwood, Musk',
            ],
            [
                'image' => 'IMG_3811.jpg',
                'sku' => 'ANIELS-3811',
                'name' => 'Ivory Musk & Jasmine',
                'category' => 'eau-de-parfum',
                'price' => 105000,
                'description' => 'Pure white tea petals, star jasmine, and clean ivory musk creating a soothing aura.',
                'top' => 'White Tea, Bergamot',
                'middle' => 'Star Jasmine, Lily',
                'base' => 'Ivory Musk, Sandalwood',
            ],
            [
                'image' => 'IMG_3812.jpg',
                'sku' => 'ANIELS-3812',
                'name' => 'Bespoke Smoked Tobacco & Vanilla',
                'category' => 'bespoke-fragrances',
                'price' => 180000,
                'description' => 'Opulent cured tobacco leaves infused with rich spices, tonka bean, and sweet wood sap.',
                'top' => 'Cured Tobacco Leaf, Spices',
                'middle' => 'Tonka Bean, Vanilla, Cacao',
                'base' => 'Dried Fruit, Cedar',
            ],
            [
                'image' => 'IMG_3813.jpg',
                'sku' => 'ANIELS-3813',
                'name' => 'Elysian Citrus & White Wood',
                'category' => 'eau-de-parfum',
                'price' => 90000,
                'description' => 'Crisp mandarin citrus opening up to magnolia blossoms and polished white cedar.',
                'top' => 'Mandarin, Bergamot',
                'middle' => 'Magnolia, Orange Blossom',
                'base' => 'White Cedar, Amber',
            ],
            [
                'image' => 'IMG_6802.JPG',
                'sku' => 'ANIELS-6802',
                'name' => 'Aniel\'s Flagship Signature Reserve',
                'category' => 'private-reserve-oud',
                'price' => 280000,
                'description' => 'The ultimate expression of Aniel\'s Perfumery. Master blended with aged wild agarwood, Taif rose, red saffron, and royal ambergris.',
                'top' => 'Aged Cambodian Oud, Red Saffron',
                'middle' => 'Taif Rose, Myrrh, Frankincense',
                'base' => 'Royal Ambergris, Mysore Sandalwood',
            ],
        ];

        foreach ($productsList as $pIndex => $p) {
            $sku = $p['sku'];
            $urlKey = Str::slug($p['name']);

            $existingProduct = DB::table('products')->where('sku', $sku)->first();

            if (! $existingProduct) {
                $productId = DB::table('products')->insertGetId([
                    'sku' => $sku,
                    'type' => 'simple',
                    'attribute_family_id' => 1,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            } else {
                $productId = $existingProduct->id;
            }

            // Insert into product_flat for default channel and en locale
            DB::table('product_flat')->updateOrInsert(
                [
                    'product_id' => $productId,
                    'channel' => 'default',
                    'locale' => 'en',
                ],
                [
                    'sku' => $sku,
                    'type' => 'simple',
                    'name' => $p['name'],
                    'short_description' => $p['description'],
                    'description' => '<p>'.$p['description'].'</p><p><strong>Top Notes:</strong> '.$p['top'].'<br><strong>Heart Notes:</strong> '.$p['middle'].'<br><strong>Base Notes:</strong> '.$p['base'].'</p>',
                    'url_key' => $urlKey,
                    'new' => 1,
                    'featured' => 1,
                    'status' => 1,
                    'visible_individually' => 1,
                    'price' => $p['price'],
                    'weight' => 0.5,
                    'attribute_family_id' => 1,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]
            );

            // Link category
            $catId = $categoryIds[$p['category']] ?? 1;
            DB::table('product_categories')->updateOrInsert([
                'product_id' => $productId,
                'category_id' => $catId,
            ]);

            // Link channel (1 = default)
            DB::table('product_channels')->updateOrInsert([
                'product_id' => $productId,
                'channel_id' => 1,
            ]);

            // Insert attribute values for Bagisto DataGrids and indexers
            $fullDesc = '<p>'.$p['description'].'</p><p><strong>Top Notes:</strong> '.$p['top'].'<br><strong>Heart Notes:</strong> '.$p['middle'].'<br><strong>Base Notes:</strong> '.$p['base'].'</p>';

            $attributeValues = [
                ['attribute_id' => 1, 'text_value' => $sku],
                ['attribute_id' => 2, 'text_value' => $p['name'], 'locale' => 'en', 'channel' => 'default'],
                ['attribute_id' => 3, 'text_value' => $urlKey, 'locale' => 'en'],
                ['attribute_id' => 5, 'boolean_value' => 1],
                ['attribute_id' => 6, 'boolean_value' => 1],
                ['attribute_id' => 7, 'boolean_value' => 1],
                ['attribute_id' => 8, 'boolean_value' => 1],
                ['attribute_id' => 9, 'text_value' => $p['description'], 'locale' => 'en', 'channel' => 'default'],
                ['attribute_id' => 10, 'text_value' => $fullDesc, 'locale' => 'en', 'channel' => 'default'],
                ['attribute_id' => 11, 'float_value' => $p['price']],
                ['attribute_id' => 22, 'float_value' => 0.5],
                ['attribute_id' => 31, 'text_value' => $p['top']],
                ['attribute_id' => 32, 'text_value' => $p['middle']],
                ['attribute_id' => 33, 'text_value' => $p['base']],
            ];

            foreach ($attributeValues as $av) {
                DB::table('product_attribute_values')->updateOrInsert([
                    'product_id' => $productId,
                    'attribute_id' => $av['attribute_id'],
                    'locale' => $av['locale'] ?? null,
                    'channel' => $av['channel'] ?? null,
                ], [
                    'text_value' => $av['text_value'] ?? null,
                    'boolean_value' => $av['boolean_value'] ?? null,
                    'float_value' => $av['float_value'] ?? null,
                ]);
            }

            // Assign inventory stock (50 bottles)
            DB::table('product_inventories')->updateOrInsert(
                [
                    'product_id' => $productId,
                    'inventory_source_id' => 1,
                ],
                [
                    'qty' => 50,
                    'vendor_id' => 0,
                ]
            );

            // Copy product image to storage/app/public/product/{product_id}/{filename}
            $targetDir = storage_path("app/public/product/{$productId}");
            File::makeDirectory($targetDir, 0755, true, true);

            $sourcePath = $sourceImageDir.'/'.$p['image'];
            $targetPath = $targetDir.'/'.$p['image'];
            $dbPath = "product/{$productId}/".$p['image'];

            if (File::exists($sourcePath)) {
                File::copy($sourcePath, $targetPath);

                DB::table('product_images')->updateOrInsert(
                    [
                        'product_id' => $productId,
                        'path' => $dbPath,
                    ],
                    [
                        'type' => 'image',
                        'position' => 1,
                    ]
                );
            }
        }
    }
}
