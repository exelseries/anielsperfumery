<x-admin::layouts>
    <x-slot:title>
        Store Owner Operations & Training Manual — Aniel's Perfumery
    </x-slot>

    <!-- Page Header -->
    <div class="mb-8 p-6 bg-gradient-to-r from-zinc-900 to-amber-950 rounded-2xl text-white shadow-xl">
        <div class="flex flex-wrap items-center justify-between gap-4">
            <div>
                <span class="text-xs uppercase tracking-widest text-amber-400 font-semibold block mb-1">Official Aniel's Perfumery Manual</span>
                <h1 class="text-3xl font-serif font-light text-amber-100">Store Owner Operations & Training Guide</h1>
                <p class="text-xs text-zinc-300 mt-1 max-w-2xl">
                    Welcome to your flagship digital boutique admin portal. Below is your comprehensive guide for daily operations, managing products, fulfilling orders across Nigeria, and protecting core system settings.
                </p>
            </div>
            <a href="https://wa.me/2348123428579" target="_blank" class="px-5 py-2.5 bg-amber-500 hover:bg-amber-400 text-zinc-950 font-bold text-xs uppercase tracking-wider rounded-lg transition-all shadow-md">
                Contact Lead Developer
            </a>
        </div>
    </div>

    <!-- SENSITIVE SYSTEM WARNING ALERT -->
    <div class="mb-8 p-5 bg-rose-50 dark:bg-rose-950/40 border-2 border-rose-500/40 rounded-2xl">
        <div class="flex items-start gap-4">
            <span class="p-3 bg-rose-500 text-white rounded-xl shadow-md shrink-0 mt-1">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                </svg>
            </span>
            <div>
                <h2 class="text-lg font-bold text-rose-800 dark:text-rose-200">⚠️ HIGH PRIORITY SAFETY NOTICE FOR SENSITIVE AREAS</h2>
                <p class="text-xs text-rose-700 dark:text-rose-300 mt-1 leading-relaxed">
                    The following two admin sections control the live codebase, database structure, and store routing. 
                    <strong class="underline">DO NOT EDIT OR DELETE ITEMS IN THESE SECTIONS WITHOUT YOUR LEAD DEVELOPER:</strong>
                </p>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mt-3">
                    <div class="p-3 bg-white dark:bg-zinc-900 border border-rose-300 dark:border-rose-800 rounded-xl">
                        <span class="text-xs font-bold text-rose-600 dark:text-rose-400 block mb-1">1. Configure Section (/admin/configuration)</span>
                        <p class="text-xs text-zinc-600 dark:text-zinc-400">
                            Controls currency conversions (NGN), database schemas, payment API keys, and theme Vite assets. Altering these settings will crash the storefront.
                        </p>
                    </div>
                    <div class="p-3 bg-white dark:bg-zinc-900 border border-rose-300 dark:border-rose-800 rounded-xl">
                        <span class="text-xs font-bold text-rose-600 dark:text-rose-400 block mb-1">2. CMS Pages & Blocks (/admin/cms)</span>
                        <p class="text-xs text-zinc-600 dark:text-zinc-400">
                            Houses core legal pages, Scent Finder quiz triggers, and luxury layout blocks. Deleting pages here removes live storefront routes.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- MODULE 1: PRODUCT & INVENTORY MANAGEMENT -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-2xl p-6 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <span class="w-8 h-8 rounded-lg bg-amber-100 dark:bg-amber-950 text-amber-600 dark:text-amber-400 flex items-center justify-center font-bold text-sm">1</span>
            <div>
                <h3 class="text-xl font-bold text-zinc-900 dark:text-white">Catalog & Product Management Masterclass</h3>
                <p class="text-xs text-zinc-500">How to edit prices, update inventory stock, and add new luxury extraits de parfum</p>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 text-xs">
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/50 rounded-xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2">🏷️ Updating Product Prices</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>Go to <strong>Catalog > Products</strong> on the left sidebar.</li>
                    <li>Click <strong>Edit (Pencil Icon)</strong> next to any fragrance.</li>
                    <li>Scroll to <strong>Price</strong> (set in ₦ NGN).</li>
                    <li>Click <strong>Save Product</strong> at top right.</li>
                </ol>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/50 rounded-xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2">📦 Managing Stock Inventory</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>In the product edit page, scroll to <strong>Inventories</strong>.</li>
                    <li>Update the <strong>Quantity</strong> number (e.g. 50 bottles).</li>
                    <li>When quantity reaches 0, the store automatically tags it as <em>Out of Stock</em>.</li>
                </ol>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/50 rounded-xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2">📸 High-Res Product Images</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>Under <strong>Images</strong>, upload square images (1000x1000px works best).</li>
                    <li>Set the primary bottle image as the first image thumbnail.</li>
                    <li>Click <strong>Save Product</strong> to publish live.</li>
                </ol>
            </div>
        </div>
    </div>

    <!-- MODULE 2: ORDER & CUSTOMER FULFILLMENT -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-2xl p-6 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <span class="w-8 h-8 rounded-lg bg-emerald-100 dark:bg-emerald-950 text-emerald-600 dark:text-emerald-400 flex items-center justify-center font-bold text-sm">2</span>
            <div>
                <h3 class="text-xl font-bold text-zinc-900 dark:text-white">Order Fulfillment & Dispatch across Abuja, Enugu & Lagos</h3>
                <p class="text-xs text-zinc-500">Processing customer orders, creating invoices, and tracking shipments</p>
            </div>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-5 text-xs">
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/50 rounded-xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2">🧾 Step 1: Viewing Orders & Creating Invoices</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed mb-2">
                    When a customer places an order on <strong>anielsperfumery.com</strong>:
                </p>
                <ul class="list-disc list-inside space-y-1 text-zinc-600 dark:text-zinc-400">
                    <li>Go to <strong>Sales > Orders</strong>. Click on the Order ID.</li>
                    <li>Verify payment (Direct Bank Transfer or Paystack).</li>
                    <li>Click <strong>Invoice</strong> (top right) to confirm receipt of funds.</li>
                </ul>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/50 rounded-xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2">🚚 Step 2: Shipping & Dispatching</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed mb-2">
                    For Abuja, Enugu, Lagos & Nationwide courier delivery:
                </p>
                <ul class="list-disc list-inside space-y-1 text-zinc-600 dark:text-zinc-400">
                    <li>Inside the order view, click <strong>Ship</strong>.</li>
                    <li>Enter Courier Name (e.g. <em>GIG Logistics / Speedaf / Local Courier</em>) and Waybill/Tracking Number.</li>
                    <li>The customer will automatically receive a dispatch notification email!</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- MODULE 3: DIRECTORY OF SENSITIVE VS SAFE AREAS -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-2xl p-6 shadow-sm">
        <h3 class="text-xl font-bold text-zinc-900 dark:text-white mb-4">🛡️ Admin Area Safety Matrix</h3>
        <div class="overflow-x-auto">
            <table class="w-full text-xs text-left border-collapse">
                <thead>
                    <tr class="bg-zinc-100 dark:bg-zinc-800 text-zinc-700 dark:text-zinc-300 font-bold uppercase tracking-wider">
                        <th class="p-3">Section</th>
                        <th class="p-3">URL Path</th>
                        <th class="p-3">Safety Status</th>
                        <th class="p-3">Allowed Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-zinc-200 dark:divide-zinc-800 text-zinc-600 dark:text-zinc-400">
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Catalog / Products</td>
                        <td class="p-3 font-mono">/admin/catalog/products</td>
                        <td class="p-3"><span class="px-2 py-1 bg-emerald-100 text-emerald-800 font-bold rounded-md">SAFE DAILY</span></td>
                        <td class="p-3">Add perfumes, edit prices, update stock, upload images.</td>
                    </tr>
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Sales / Orders</td>
                        <td class="p-3 font-mono">/admin/sales/orders</td>
                        <td class="p-3"><span class="px-2 py-1 bg-emerald-100 text-emerald-800 font-bold rounded-md">SAFE DAILY</span></td>
                        <td class="p-3">Process orders, create invoices, mark dispatched.</td>
                    </tr>
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Customers</td>
                        <td class="p-3 font-mono">/admin/customers</td>
                        <td class="p-3"><span class="px-2 py-1 bg-emerald-100 text-emerald-800 font-bold rounded-md">SAFE DAILY</span></td>
                        <td class="p-3">View VIP client list, reviews, customer notes.</td>
                    </tr>
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Marketing & Discounts</td>
                        <td class="p-3 font-mono">/admin/marketing</td>
                        <td class="p-3"><span class="px-2 py-1 bg-amber-100 text-amber-800 font-bold rounded-md">CAUTION</span></td>
                        <td class="p-3">Create promo coupon codes. Avoid deleting URL rewrites.</td>
                    </tr>
                    <tr class="bg-rose-50/50 dark:bg-rose-950/20">
                        <td class="p-3 font-semibold text-rose-700 dark:text-rose-300">CMS Pages & Layouts</td>
                        <td class="p-3 font-mono text-rose-700 dark:text-rose-300">/admin/cms</td>
                        <td class="p-3"><span class="px-2 py-1 bg-rose-200 text-rose-900 font-bold rounded-md">SENSITIVE</span></td>
                        <td class="p-3">Contains live core pages. Contact dev before modifying.</td>
                    </tr>
                    <tr class="bg-rose-50/50 dark:bg-rose-950/20">
                        <td class="p-3 font-semibold text-rose-700 dark:text-rose-300">System Configuration</td>
                        <td class="p-3 font-mono text-rose-700 dark:text-rose-300">/admin/configuration</td>
                        <td class="p-3"><span class="px-2 py-1 bg-rose-200 text-rose-900 font-bold rounded-md">HIGH RISK</span></td>
                        <td class="p-3">Controls core PHP routes & keys. DO NOT EDIT ALONE.</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</x-admin::layouts>
