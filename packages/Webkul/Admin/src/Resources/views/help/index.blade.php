<x-admin::layouts>
    <x-slot:title>
        Master Operations & Training Manual — Aniel's Perfumery
    </x-slot>

    <!-- Page Header -->
    <div class="mb-8 p-8 bg-gradient-to-r from-zinc-950 via-amber-950 to-zinc-900 rounded-3xl text-white shadow-2xl border border-amber-500/20">
        <div class="flex flex-wrap items-center justify-between gap-6">
            <div>
                <div class="flex items-center gap-2 mb-2">
                    <span class="px-3 py-1 bg-amber-500/20 border border-amber-400/30 text-amber-300 rounded-full text-[10px] uppercase font-bold tracking-widest">
                        Official Store Owner Handbook
                    </span>
                    <span class="text-xs text-zinc-400 font-mono">v2.4 Live Edition</span>
                </div>
                <h1 class="text-3xl sm:text-4xl font-serif font-light text-amber-100">Aniel's Perfumery Master Operations Guide</h1>
                <p class="text-xs sm:text-sm text-zinc-300 mt-2 max-w-3xl leading-relaxed">
                    The complete step-by-step training manual for managing your luxury digital flagship store. Learn how to process orders across Abuja, Enugu, and Lagos, add new fragrance extraits, update prices, manage stock, and protect system infrastructure.
                </p>
            </div>
            <div class="flex flex-col sm:flex-row gap-3">
                <a href="https://wa.me/2348086304821" target="_blank" class="inline-flex items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-amber-500 to-amber-600 hover:from-amber-400 hover:to-amber-500 text-zinc-950 font-bold text-xs uppercase tracking-wider rounded-xl transition-all shadow-lg hover:shadow-amber-500/20">
                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24"><path d="M.057 24l1.687-6.163c-1.041-1.804-1.588-3.849-1.587-5.946.003-6.556 5.338-11.891 11.893-11.891 3.181.001 6.167 1.24 8.413 3.488 2.245 2.248 3.481 5.236 3.48 8.414-.003 6.557-5.338 11.892-11.893 11.892-1.99-.001-3.951-.5-5.688-1.448l-6.305 1.654zm6.597-3.807c1.676.995 3.276 1.591 5.392 1.592 5.448 0 9.886-4.434 9.889-9.885.002-5.462-4.415-9.89-9.881-9.892-5.452 0-9.887 4.434-9.889 9.884-.001 2.225.651 3.891 1.746 5.634l-.999 3.648 3.742-.981zm11.387-5.464c-.074-.124-.272-.198-.57-.347-.297-.149-1.758-.868-2.031-.967-.272-.099-.47-.149-.669.149-.198.297-.768.967-.941 1.165-.173.198-.347.223-.644.074-.297-.149-1.255-.462-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.297-.347.446-.521.151-.172.2-.296.3-.495.099-.198.05-.372-.025-.521-.075-.148-.669-1.611-.916-2.206-.242-.579-.487-.501-.669-.51l-.57-.01c-.198 0-.52.074-.792.372s-1.04 1.016-1.04 2.479 1.065 2.876 1.213 3.074c.149.198 2.095 3.2 5.076 4.487.709.306 1.263.489 1.694.626.712.226 1.36.194 1.872.118.571-.085 1.758-.719 2.006-1.413.248-.695.248-1.29.173-1.414z"/></svg>
                    Contact Lead Developer
                </a>
            </div>
        </div>
    </div>

    <!-- SENSITIVE SYSTEM WARNING MATRIX (RED CRITICAL NOTICE) -->
    <div class="mb-12 p-6 bg-rose-50 dark:bg-rose-950/50 border-2 border-rose-500/50 rounded-3xl shadow-lg">
        <div class="flex items-start gap-4">
            <span class="p-3 bg-rose-600 text-white rounded-2xl shadow-lg shrink-0 mt-1">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                </svg>
            </span>
            <div class="w-full">
                <div class="flex items-center justify-between gap-4">
                    <h2 class="text-xl font-bold text-rose-900 dark:text-rose-100">⚠️ HIGH RISK: SENSITIVE INFRASTRUCTURE AREAS</h2>
                    <span class="px-3 py-1 bg-rose-600 text-white text-[10px] uppercase font-extrabold rounded-md">Tread With Extreme Caution</span>
                </div>
                <p class="text-xs text-rose-800 dark:text-rose-200 mt-1 leading-relaxed">
                    The two sections below contain core database routing, currency engines, theme manifests, and legal agreements. <strong class="underline">NEVER edit or delete items in these sections without direct confirmation from Lead Developer (08086304821):</strong>
                </p>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-5 mt-4">
                    <div class="p-4 bg-white dark:bg-zinc-900 border border-rose-300 dark:border-rose-800/80 rounded-2xl shadow-sm">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-bold text-sm text-rose-700 dark:text-rose-400">1. Configure Section (/admin/configuration)</span>
                            <span class="text-[10px] font-bold px-2 py-0.5 bg-rose-100 dark:bg-rose-900/80 text-rose-800 dark:text-rose-200 rounded">HIGH DANGER</span>
                        </div>
                        <p class="text-xs text-zinc-600 dark:text-zinc-300 leading-relaxed">
                            Controls currency symbols (₦ NGN), payment API keys, email SMTP credentials, and theme Vite build directories. Changing paths here will break the live storefront instantly.
                        </p>
                    </div>
                    <div class="p-4 bg-white dark:bg-zinc-900 border border-rose-300 dark:border-rose-800/80 rounded-2xl shadow-sm">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-bold text-sm text-rose-700 dark:text-rose-400">2. CMS Pages & Blocks (/admin/cms)</span>
                            <span class="text-[10px] font-bold px-2 py-0.5 bg-rose-100 dark:bg-rose-900/80 text-rose-800 dark:text-rose-200 rounded">SENSITIVE</span>
                        </div>
                        <p class="text-xs text-zinc-600 dark:text-zinc-300 leading-relaxed">
                            Houses Privacy Policy, Shipping Terms, Scent Finder Quiz triggers, and custom HTML layout blocks. Deleting pages here creates broken links across search engines.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- MODULE 1: DASHBOARD & METRICS -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-3xl p-6 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <span class="w-10 h-10 rounded-2xl bg-amber-500/10 text-amber-600 dark:text-amber-400 flex items-center justify-center font-bold text-base border border-amber-500/20">1</span>
            <div>
                <h3 class="text-xl font-bold text-zinc-900 dark:text-white">Dashboard Overview & Business Analytics</h3>
                <p class="text-xs text-zinc-500">Understanding sales charts, daily order counters, and stock thresholds</p>
            </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 text-xs">
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-1 text-sm">📊 Total & Daily Sales (₦ NGN)</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed">
                    Tracks net revenue generated across all completed transactions. Filter by date ranges at the top right to compare monthly growth.
                </p>
            </div>
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-1 text-sm">📦 Total & Pending Orders</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed">
                    Shows incoming client orders awaiting invoice or dispatch. Clicking an order takes you straight into the processing screen.
                </p>
            </div>
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-1 text-sm">⚠️ Stock Threshold Alert</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed">
                    Displays perfumes running low on inventory (below 5 bottles). Use this to re-order inventory from your suppliers before selling out.
                </p>
            </div>
        </div>
    </div>

    <!-- MODULE 2: CATALOG & PRODUCT MANAGEMENT -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-3xl p-6 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <span class="w-10 h-10 rounded-2xl bg-amber-500/10 text-amber-600 dark:text-amber-400 flex items-center justify-center font-bold text-base border border-amber-500/20">2</span>
            <div>
                <h3 class="text-xl font-bold text-zinc-900 dark:text-white">Catalog & Product Management</h3>
                <p class="text-xs text-zinc-500">How to edit fragrance prices, update stock, and add new luxury extraits</p>
            </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-5 text-xs">
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">🏷️ Price & Discount Setup</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>Go to <strong>Catalog > Products</strong>.</li>
                    <li>Click <strong>Edit (Pencil)</strong>.</li>
                    <li>Set <strong>Price</strong> (in ₦ NGN).</li>
                    <li>Optionally set <strong>Special Price</strong> for sales.</li>
                </ol>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">📦 Inventory & Stock Quantity</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>Inside product edit page, find <strong>Inventories</strong>.</li>
                    <li>Enter stock count (e.g. 50 bottles).</li>
                    <li>If stock is 0, the item displays as <em>Out of Stock</em> live.</li>
                </ol>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">📸 High-Res Bottle Imagery</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>Under <strong>Images</strong>, drag and drop square photos (1000x1000px).</li>
                    <li>First image becomes primary thumbnail on homepage.</li>
                </ol>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">🌹 Categories & Scent Notes</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>Check appropriate Categories (e.g. <em>Arabian Oud, Floral, Niche</em>).</li>
                    <li>Add Scent Pyramid (Top, Heart, Base Notes) in description.</li>
                </ol>
            </div>
        </div>
    </div>

    <!-- MODULE 3: ORDER FULFILLMENT & DISPATCH -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-3xl p-6 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <span class="w-10 h-10 rounded-2xl bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 flex items-center justify-center font-bold text-base border border-emerald-500/20">3</span>
            <div>
                <h3 class="text-xl font-bold text-zinc-900 dark:text-white">Order Processing & Dispatch Workflow</h3>
                <p class="text-xs text-zinc-500">Handling customer orders, issuing invoices, and dispatching to Abuja, Enugu & Lagos</p>
            </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 text-xs">
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">Step 1: Order Verification</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed mb-2">
                    Open <strong>Sales > Orders</strong>. Check payment method (Direct Bank Transfer or Paystack). Verify funds received in corporate bank account.
                </p>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">Step 2: Generate Invoice</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed mb-2">
                    Inside the order view, click <strong>Invoice</strong> (top right) -> click <strong>Create Invoice</strong>. This officially confirms payment and sends receipt email.
                </p>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">Step 3: Courier Dispatch & Tracking</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed mb-2">
                    Click <strong>Ship</strong> -> enter Courier Carrier (e.g. <em>GIG Logistics / Speedaf / Abuja Dispatch</em>) and Waybill tracking number -> click <strong>Create Shipment</strong>.
                </p>
            </div>
        </div>
    </div>

    <!-- MODULE 4: MARKETING, PROMOS & CUSTOMERS -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-3xl p-6 shadow-sm">
        <div class="flex items-center gap-3 mb-6">
            <span class="w-10 h-10 rounded-2xl bg-amber-500/10 text-amber-600 dark:text-amber-400 flex items-center justify-center font-bold text-base border border-amber-500/20">4</span>
            <div>
                <h3 class="text-xl font-bold text-zinc-900 dark:text-white">Marketing, Promo Codes & VIP Customers</h3>
                <p class="text-xs text-zinc-500">Creating discount coupons, viewing VIP scent profiles, and moderating client reviews</p>
            </div>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 text-xs">
            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">🎁 Creating Coupon Promo Codes</span>
                <ol class="list-decimal list-inside space-y-1.5 text-zinc-600 dark:text-zinc-400">
                    <li>Go to <strong>Marketing > Cart Rules</strong>.</li>
                    <li>Click <strong>Create Cart Rule</strong>.</li>
                    <li>Set Coupon Code (e.g. <code>ANIELS10</code> for 10% off).</li>
                    <li>Define discount percentage or fixed ₦ amount.</li>
                </ol>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">👑 VIP Customer Directory</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed">
                    Under <strong>Customers > Customers</strong>, view registered client accounts, order frequency, total spending, and delivery addresses across Nigeria.
                </p>
            </div>

            <div class="p-4 bg-zinc-50 dark:bg-zinc-800/40 rounded-2xl border border-zinc-200 dark:border-zinc-800">
                <span class="font-bold text-zinc-900 dark:text-white block mb-2 text-sm">⭐ Product Reviews & Ratings</span>
                <p class="text-zinc-600 dark:text-zinc-400 leading-relaxed">
                    Under <strong>Marketing > Reviews</strong>, approve or moderate client reviews before they display publicly on product pages.
                </p>
            </div>
        </div>
    </div>

    <!-- MODULE 5: MASTER AREA SAFETY MATRIX -->
    <div class="mb-10 bg-white dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-800 rounded-3xl p-6 shadow-sm">
        <h3 class="text-xl font-bold text-zinc-900 dark:text-white mb-4">🛡️ Full Admin Safety & Permission Matrix</h3>
        <div class="overflow-x-auto">
            <table class="w-full text-xs text-left border-collapse">
                <thead>
                    <tr class="bg-zinc-100 dark:bg-zinc-800 text-zinc-700 dark:text-zinc-300 font-bold uppercase tracking-wider">
                        <th class="p-3">Section</th>
                        <th class="p-3">URL Path</th>
                        <th class="p-3">Status</th>
                        <th class="p-3">Allowed Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-zinc-200 dark:divide-zinc-800 text-zinc-600 dark:text-zinc-400">
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Dashboard</td>
                        <td class="p-3 font-mono">/admin/dashboard</td>
                        <td class="p-3"><span class="px-2 py-1 bg-emerald-100 text-emerald-800 font-bold rounded-md">DAILY SAFE</span></td>
                        <td class="p-3">View revenue metrics, order stats, low stock products.</td>
                    </tr>
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Sales & Orders</td>
                        <td class="p-3 font-mono">/admin/sales/orders</td>
                        <td class="p-3"><span class="px-2 py-1 bg-emerald-100 text-emerald-800 font-bold rounded-md">DAILY SAFE</span></td>
                        <td class="p-3">Process orders, issue invoices, enter courier tracking info.</td>
                    </tr>
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Catalog & Products</td>
                        <td class="p-3 font-mono">/admin/catalog/products</td>
                        <td class="p-3"><span class="px-2 py-1 bg-emerald-100 text-emerald-800 font-bold rounded-md">DAILY SAFE</span></td>
                        <td class="p-3">Edit prices (₦ NGN), inventory stock, photos, scent notes.</td>
                    </tr>
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Customers & Reviews</td>
                        <td class="p-3 font-mono">/admin/customers</td>
                        <td class="p-3"><span class="px-2 py-1 bg-emerald-100 text-emerald-800 font-bold rounded-md">DAILY SAFE</span></td>
                        <td class="p-3">View client profiles, moderate client reviews & star ratings.</td>
                    </tr>
                    <tr>
                        <td class="p-3 font-semibold text-zinc-900 dark:text-white">Marketing & Coupons</td>
                        <td class="p-3 font-mono">/admin/marketing</td>
                        <td class="p-3"><span class="px-2 py-1 bg-amber-100 text-amber-800 font-bold rounded-md">CAUTION</span></td>
                        <td class="p-3">Create promo codes. Avoid deleting URL rewrites.</td>
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

    <!-- DIRECT DEVELOPER SUPPORT CONTACT BANNER -->
    <div class="p-6 bg-gradient-to-r from-amber-500 to-amber-600 rounded-3xl text-zinc-950 shadow-xl flex flex-wrap items-center justify-between gap-4">
        <div>
            <h3 class="text-xl font-bold">Need Personal Technical Assistance or Custom Features?</h3>
            <p class="text-xs text-zinc-900 mt-1 font-medium">
                Your Lead Developer is available for maintenance, feature upgrades, and payment gateway support.
            </p>
        </div>
        <div class="flex items-center gap-3">
            <a href="tel:08086304821" class="px-5 py-3 bg-zinc-950 text-white hover:bg-zinc-800 font-bold text-xs uppercase tracking-wider rounded-xl transition-all shadow-md">
                📞 Call: 0808 630 4821
            </a>
            <a href="https://wa.me/2348086304821" target="_blank" class="px-5 py-3 bg-white text-zinc-950 hover:bg-zinc-100 font-bold text-xs uppercase tracking-wider rounded-xl transition-all shadow-md">
                💬 WhatsApp Developer
            </a>
        </div>
    </div>
</x-admin::layouts>
