<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FragranceAttributesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $now = Carbon::now();
        $locales = ['en', 'fr', 'es', 'de', 'ar']; // Primary locales

        // Find or default attribute group ID (General group under Default family)
        $attributeGroupId = DB::table('attribute_groups')->where('attribute_family_id', 1)->value('id') ?? 1;

        $attributes = [
            [
                'code'                => 'top_notes',
                'admin_name'          => 'Top Notes',
                'type'                => 'text',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
            ],
            [
                'code'                => 'middle_notes',
                'admin_name'          => 'Middle Notes',
                'type'                => 'text',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
            ],
            [
                'code'                => 'base_notes',
                'admin_name'          => 'Base Notes',
                'type'                => 'text',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
            ],
            [
                'code'                => 'fragrance_family',
                'admin_name'          => 'Fragrance Family',
                'type'                => 'select',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
                'options'             => ['Oud & Spicy', 'Citrus & Aquatic', 'Vanilla & Amber', 'Floral & Musk', 'Leather & Woods'],
            ],
            [
                'code'                => 'longevity',
                'admin_name'          => 'Longevity Rating',
                'type'                => 'select',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
                'options'             => ['Intimate', 'Moderate', 'Long Lasting', 'Eternal'],
            ],
            [
                'code'                => 'projection',
                'admin_name'          => 'Projection Rating',
                'type'                => 'select',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
                'options'             => ['Intimate', 'Moderate', 'Strong', 'Enormous'],
            ],
            [
                'code'                => 'occasion',
                'admin_name'          => 'Occasion',
                'type'                => 'multiselect',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
                'options'             => ['Office', 'Date Night', 'Wedding', 'Everyday', 'Party'],
            ],
            [
                'code'                => 'season',
                'admin_name'          => 'Season',
                'type'                => 'multiselect',
                'validation'          => null,
                'is_required'         => 0,
                'is_unique'           => 0,
                'value_per_locale'    => 0,
                'value_per_channel'   => 0,
                'is_filterable'       => 1,
                'is_configurable'     => 0,
                'is_user_defined'     => 1,
                'is_visible_on_front' => 1,
                'is_comparable'       => 1,
                'enable_wysiwyg'      => 0,
                'options'             => ['Dry Season', 'Rainy Season', 'All-Year'],
            ],
        ];

        foreach ($attributes as $index => $attrData) {
            $options = $attrData['options'] ?? [];
            unset($attrData['options']);

            $existingAttribute = DB::table('attributes')->where('code', $attrData['code'])->first();

            if (! $existingAttribute) {
                $attrData['position'] = $index + 50;
                $attrData['created_at'] = $now;
                $attrData['updated_at'] = $now;

                $attributeId = DB::table('attributes')->insertGetId($attrData);
            } else {
                $attributeId = $existingAttribute->id;
            }

            // Insert attribute translations
            foreach ($locales as $locale) {
                DB::table('attribute_translations')->updateOrInsert(
                    ['attribute_id' => $attributeId, 'locale' => $locale],
                    ['name' => $attrData['admin_name']]
                );
            }

            // Map attribute to Default Attribute Group
            DB::table('attribute_group_mappings')->updateOrInsert(
                ['attribute_id' => $attributeId, 'attribute_group_id' => $attributeGroupId],
                ['position' => $index + 50]
            );

            // Create options for select / multiselect attributes
            if (! empty($options)) {
                foreach ($options as $optOrder => $optName) {
                    $existingOption = DB::table('attribute_options')
                        ->where('attribute_id', $attributeId)
                        ->where('admin_name', $optName)
                        ->first();

                    if (! $existingOption) {
                        $optionId = DB::table('attribute_options')->insertGetId([
                            'attribute_id' => $attributeId,
                            'admin_name'   => $optName,
                            'sort_order'   => $optOrder + 1,
                        ]);
                    } else {
                        $optionId = $existingOption->id;
                    }

                    foreach ($locales as $locale) {
                        DB::table('attribute_option_translations')->updateOrInsert(
                            ['attribute_option_id' => $optionId, 'locale' => $locale],
                            ['label' => $optName]
                        );
                    }
                }
            }
        }
    }
}
