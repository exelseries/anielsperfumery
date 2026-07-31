{!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.before') !!}

<div class="flex min-h-[78px] w-full justify-between border border-b border-l-0 border-r-0 border-t-0 px-[60px] max-1180:px-8">
    <!--
        This section will provide categories for the first, second, and third levels. If
        additional levels are required, users can customize them according to their needs.
    -->
    <!-- Left Nagivation Section -->
    <div class="flex items-center gap-x-10 max-[1180px]:gap-x-5">
        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.logo.before') !!}

        <a
            href="{{ route('shop.home.index') }}"
            class="flex items-center space-x-3 group py-1.5"
            aria-label="Aniel's Perfumery"
        >
            <img src="/logomain.png" alt="Aniel's Perfumery Emblem" class="h-12 lg:h-14 w-auto object-contain transition-transform duration-300 group-hover:scale-105">
            <div class="flex flex-col text-left">
                <span class="font-serif text-xl lg:text-2xl font-bold tracking-[0.25em] text-[#C5A059] leading-none">ANIEL'S</span>
                <span class="text-[9px] tracking-[0.4em] uppercase text-gray-500 mt-1 font-semibold">P E R F U M E R Y</span>
            </div>
        </a>

        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.logo.after') !!}

        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.category.before') !!}

        <v-desktop-category>
            <div class="flex items-center gap-5">
                <span
                    class="w-20 h-6 rounded shimmer"
                    role="presentation"
                ></span>

                <span
                    class="w-20 h-6 rounded shimmer"
                    role="presentation"
                ></span>

                <span
                    class="w-20 h-6 rounded shimmer"
                    role="presentation"
                ></span>
            </div>
        </v-desktop-category>

        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.category.after') !!}
    </div>

    <!-- Right Nagivation Section -->
    <div class="flex items-center gap-x-9 max-[1100px]:gap-x-6 max-lg:gap-x-8">

        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.search_bar.before') !!}

        <!-- Search Bar Container -->
        <div class="relative w-full">
            <form
                action="{{ route('shop.search.index') }}"
                class="flex max-w-[445px] items-center"
                role="search"
                toolname="search_products"
                tooldescription="{{ trans('shop::app.components.layouts.webmcp.search-products') }}"
                toolautosubmit
            >
                <label
                    for="organic-search"
                    class="sr-only"
                >
                    @lang('shop::app.components.layouts.header.desktop.bottom.search')
                </label>

                <div class="icon-search pointer-events-none absolute top-2.5 flex items-center text-xl ltr:left-3 rtl:right-3"></div>

                <input
                    type="text"
                    name="query"
                    value="{{ request('query') }}"
                    toolparamdescription="{{ trans('shop::app.components.layouts.webmcp.search-products-query') }}"
                    class="block w-full py-3 text-xs font-medium text-gray-900 transition-all border border-transparent rounded-lg bg-zinc-100 px-11 hover:border-gray-400 focus:border-gray-400"
                    minlength="{{ core()->getConfigData('catalog.products.search.min_query_length') }}"
                    maxlength="{{ core()->getConfigData('catalog.products.search.max_query_length') }}"
                    placeholder="@lang('shop::app.components.layouts.header.desktop.bottom.search-text')"
                    aria-label="@lang('shop::app.components.layouts.header.desktop.bottom.search-text')"
                    aria-required="true"
                    pattern="[^\\]+"
                    required
                >

                <button
                    type="submit"
                    class="hidden"
                    aria-label="@lang('shop::app.components.layouts.header.desktop.bottom.submit')"
                >
                </button>

                @if (core()->getConfigData('catalog.products.settings.image_search'))
                    @include('shop::search.images.index')
                @endif
            </form>
        </div>

        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.search_bar.after') !!}

        <!-- Right Navigation Links -->
        <div class="mt-1.5 flex items-center gap-x-8 max-[1100px]:gap-x-6 max-lg:gap-x-8">

            <!-- Light/Dark Mode Switcher -->
            <button
                type="button"
                onclick="toggleThemeMode()"
                class="flex items-center justify-center p-1.5 rounded-full text-gray-700 dark:text-gray-200 hover:text-[#C5A059] transition-colors"
                title="Toggle Light / Dark Mode"
                aria-label="Toggle Theme Mode"
            >
                <span class="dark:hidden text-lg">🌙</span>
                <span class="hidden dark:inline-block text-lg">☀️</span>
            </button>

            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.compare.before') !!}

            <!-- Compare -->
            @if(core()->getConfigData('catalog.products.settings.compare_option'))
                <a
                    href="{{ route('shop.compare.index') }}"
                    aria-label="@lang('shop::app.components.layouts.header.desktop.bottom.compare')"
                >
                    <span
                        class="inline-block text-2xl cursor-pointer icon-compare"
                        role="presentation"
                    ></span>
                </a>
            @endif

            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.compare.after') !!}

            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.mini_cart.before') !!}

            <!-- Mini cart -->
            @if(core()->getConfigData('sales.checkout.shopping_cart.cart_page'))
                @include('shop::checkout.cart.mini-cart')
            @endif

            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.mini_cart.after') !!}

            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.profile.before') !!}

            <!-- user profile -->
            <x-shop::dropdown position="bottom-{{ core()->getCurrentLocale()->direction === 'ltr' ? 'right' : 'left' }}">
                <x-slot:toggle>
                    <span
                        class="inline-block text-2xl cursor-pointer icon-users"
                        role="button"
                        aria-label="@lang('shop::app.components.layouts.header.desktop.bottom.profile')"
                        tabindex="0"
                    ></span>
                </x-slot>

                <!-- Guest Dropdown -->
                @guest('customer')
                    <x-slot:content>
                        <div class="grid gap-2.5">
                            <p class="text-xl font-dmserif">
                                @lang('shop::app.components.layouts.header.desktop.bottom.welcome-guest')
                            </p>

                            <p class="text-sm">
                                @lang('shop::app.components.layouts.header.desktop.bottom.dropdown-text')
                            </p>
                        </div>

                        <p class="w-full mt-3 border border-zinc-200"></p>

                        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.customers_action.before') !!}

                        <div class="flex gap-4 mt-6">
                            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.sign_in_button.before') !!}

                            <a
                                href="{{ route('shop.customer.session.create') }}"
                                class="block m-0 mx-auto text-base text-center primary-button w-max rounded-2xl px-7 max-md:rounded-lg ltr:ml-0 rtl:mr-0"
                            >
                                @lang('shop::app.components.layouts.header.desktop.bottom.sign-in')
                            </a>

                            <a
                                href="{{ route('shop.customers.register.index') }}"
                                class="block m-0 mx-auto text-base text-center border-2 secondary-button w-max rounded-2xl px-7 max-md:rounded-lg max-md:py-3 ltr:ml-0 rtl:mr-0"
                            >
                                @lang('shop::app.components.layouts.header.desktop.bottom.sign-up')
                            </a>

                            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.sign_up_button.after') !!}
                        </div>

                        @if (core()->getConfigData('sales.eu_withdrawal.general.enabled', core()->getCurrentChannelCode()))
                            <a
                                href="{{ route('shop.eu-withdrawal.guest.lookup') }}"
                                class="mt-4 inline-flex items-center gap-1.5 text-xs font-medium text-navyBlue hover:underline"
                            >
                                @lang('shop::app.eu_withdrawal.guest_dropdown.link')
                            </a>
                        @endif

                        {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.customers_action.after') !!}
                    </x-slot>
                @endguest

                <!-- Customers Dropdown -->
                @auth('customer')
                    <x-slot:content class="!p-0">
                        <div class="grid gap-2.5 p-5 pb-0">
                            <p class="text-xl font-dmserif" v-pre>
                                @lang('shop::app.components.layouts.header.desktop.bottom.welcome')’
                                {{ auth()->guard('customer')->user()->first_name }}
                            </p>

                            <p class="text-sm">
                                @lang('shop::app.components.layouts.header.desktop.bottom.dropdown-text')
                            </p>
                        </div>

                        <p class="w-full mt-3 border border-zinc-200"></p>

                        <div class="mt-2.5 grid gap-1 pb-2.5">
                            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.profile_dropdown.links.before') !!}

                            <a
                                class="px-5 py-2 text-base cursor-pointer hover:bg-gray-100"
                                href="{{ route('shop.customers.account.profile.index') }}"
                            >
                                @lang('shop::app.components.layouts.header.desktop.bottom.profile')
                            </a>

                            <a
                                class="px-5 py-2 text-base cursor-pointer hover:bg-gray-100"
                                href="{{ route('shop.customers.account.orders.index') }}"
                            >
                                @lang('shop::app.components.layouts.header.desktop.bottom.orders')
                            </a>

                            @if (core()->getConfigData('customer.settings.wishlist.wishlist_option'))
                                <a
                                    class="px-5 py-2 text-base cursor-pointer hover:bg-gray-100"
                                    href="{{ route('shop.customers.account.wishlist.index') }}"
                                >
                                    @lang('shop::app.components.layouts.header.desktop.bottom.wishlist')
                                </a>
                            @endif

                            <!--Customers logout-->
                            @auth('customer')
                                <x-shop::form
                                    method="DELETE"
                                    action="{{ route('shop.customer.session.destroy') }}"
                                    id="customerLogout"
                                />

                                <a
                                    class="px-5 py-2 text-base cursor-pointer hover:bg-gray-100"
                                    href="{{ route('shop.customer.session.destroy') }}"
                                    onclick="event.preventDefault(); document.getElementById('customerLogout').submit();"
                                >
                                    @lang('shop::app.components.layouts.header.desktop.bottom.logout')
                                </a>
                            @endauth

                            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.profile_dropdown.links.after') !!}
                        </div>
                    </x-slot>
                @endauth
            </x-shop::dropdown>

            {!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.profile.after') !!}
        </div>
    </div>
</div>

@pushOnce('scripts')
    <script
        type="text/x-template"
        id="v-desktop-category-template"
    >
        <div class="flex items-center">
            <!-- Categories Navigation -->
            <div class="flex items-center">
                <!-- Hamburger button for opening the category drawer -->
                <div
                    class="flex h-[77px] cursor-pointer items-center border-b-4 border-transparent hover:border-b-4 hover:border-champagneGold ltr:mr-3 rtl:ml-3"
                    @click="toggleCategoryDrawer"
                    aria-label="Toggle Category Drawer"
                >
                    <span class="flex items-center gap-1 px-2 uppercase text-xs font-semibold tracking-widest text-matteBlack hover:text-champagneGold">
                        <span class="text-2xl icon-hamburger"></span>
                    </span>
                </div>

                <div class="group relative flex h-[77px] items-center border-b-4 border-transparent hover:border-b-4 hover:border-champagneGold">
                    <span>
                        <a href="{{ route('shop.home.index') }}" class="inline-block px-4 text-xs uppercase tracking-widest font-medium hover:text-champagneGold">Home</a>
                    </span>
                </div>
                <div class="group relative flex h-[77px] items-center border-b-4 border-transparent hover:border-b-4 hover:border-champagneGold">
                    <span>
                        <a href="{{ route('shop.search.index') }}" class="inline-block px-4 text-xs uppercase tracking-widest font-semibold text-champagneGold">Shop All</a>
                    </span>
                </div>
                <div class="group relative flex h-[77px] items-center border-b-4 border-transparent hover:border-b-4 hover:border-champagneGold">
                    <span>
                        <a href="{{ route('shop.home.our_story') }}" class="inline-block px-4 text-xs uppercase tracking-widest font-medium hover:text-champagneGold">Our Story</a>
                    </span>
                </div>
                <div class="group relative flex h-[77px] items-center border-b-4 border-transparent hover:border-b-4 hover:border-champagneGold">
                    <span>
                        <a href="{{ route('shop.scent_finder.index') }}" class="inline-block px-4 text-xs uppercase tracking-widest font-medium hover:text-champagneGold">Scent Finder</a>
                    </span>
                </div>
                <div class="group relative flex h-[77px] items-center border-b-4 border-transparent hover:border-b-4 hover:border-champagneGold">
                    <span>
                        <a href="{{ route('shop.home.contact_us') }}" class="inline-block px-4 text-xs uppercase tracking-widest font-medium hover:text-champagneGold">Contact</a>
                    </span>
                </div>
            </div>

            <!-- Bagisto Drawer Integration -->
            <x-shop::drawer
                position="left"
                width="400px"
                ::is-active="isDrawerActive"
                @toggle="onDrawerToggle"
                @close="onDrawerClose"
            >
                <x-slot:toggle></x-slot>

                <x-slot:header class="border-b border-[#D4AF37]/30 bg-[#121212] px-6 py-4">
                    <div class="flex items-center justify-between w-full">
                        <p class="text-lg font-serif tracking-widest text-[#D4AF37] uppercase font-semibold">
                            Aniel's Perfumery
                        </p>
                    </div>
                </x-slot>

                <x-slot:content class="!px-0 bg-[#121212]">
                    <!-- Wrapper with transition effects -->
                    <div class="relative h-full overflow-hidden bg-[#121212]">
                        <!-- Sliding container -->
                        <div
                            class="flex h-full transition-transform duration-300 bg-[#121212]"
                            :class="{
                                'ltr:translate-x-0 rtl:translate-x-0': currentViewLevel !== 'third',
                                'ltr:-translate-x-full rtl:translate-x-full': currentViewLevel === 'third'
                            }"
                        >
                            <!-- First level view -->
                            <div class="h-[calc(100vh-74px)] w-full flex-shrink-0 overflow-auto bg-[#121212]">
                                <div class="py-4">
                                    <!-- Curated Quick Links -->
                                    <div class="mb-4 pb-3 border-b border-[#C5A059]/20 px-6">
                                        <p class="text-xs uppercase tracking-widest text-[#C5A059] font-medium mb-3">Collections & Discovery</p>
                                        <div class="space-y-1.5">
                                            <a href="{{ route('shop.search.index') }}" class="flex items-center gap-3 py-2 text-sm text-neutral-200 hover:text-[#D4AF37] transition-colors">
                                                <span class="w-1.5 h-1.5 rounded-full bg-[#D4AF37]"></span>
                                                Shop All Fragrances
                                            </a>
                                            <a href="/extrait-de-parfum" class="flex items-center gap-3 py-2 text-sm text-neutral-200 hover:text-[#D4AF37] transition-colors">
                                                <span class="w-1.5 h-1.5 rounded-full bg-[#D4AF37]"></span>
                                                Extrait de Parfum
                                            </a>
                                            <a href="/eau-de-parfum" class="flex items-center gap-3 py-2 text-sm text-neutral-200 hover:text-[#D4AF37] transition-colors">
                                                <span class="w-1.5 h-1.5 rounded-full bg-[#D4AF37]"></span>
                                                Eau de Parfum
                                            </a>
                                            <a href="/private-reserve-oud" class="flex items-center gap-3 py-2 text-sm text-neutral-200 hover:text-[#D4AF37] transition-colors">
                                                <span class="w-1.5 h-1.5 rounded-full bg-[#D4AF37]"></span>
                                                Private Reserve Oud
                                            </a>
                                            <a href="/bespoke-fragrances" class="flex items-center gap-3 py-2 text-sm text-neutral-200 hover:text-[#D4AF37] transition-colors">
                                                <span class="w-1.5 h-1.5 rounded-full bg-[#D4AF37]"></span>
                                                Bespoke Fragrances
                                            </a>
                                            <a href="/scent-finder" class="flex items-center gap-3 py-2 text-sm text-[#D4AF37] font-medium hover:underline transition-colors">
                                                <span class="w-1.5 h-1.5 rounded-full bg-[#D4AF37]"></span>
                                                Scent Finder Quiz ✨
                                            </a>
                                            <a href="/why-aniels" class="flex items-center gap-3 py-2 text-sm text-neutral-300 hover:text-white transition-colors">
                                                <span class="w-1.5 h-1.5 rounded-full bg-neutral-500"></span>
                                                Our Story
                                            </a>
                                        </div>
                                    </div>

                                    <!-- Dynamic Category Tree -->
                                    <div class="px-6 mb-2">
                                        <p class="text-xs uppercase tracking-widest text-[#C5A059] font-medium">All Categories</p>
                                    </div>
                                    <div
                                        v-for="category in categories"
                                        :key="category.id"
                                        :class="{'mb-1': category.children && category.children.length}"
                                    >
                                        <div class="flex items-center justify-between px-6 py-2.5 transition-colors duration-200 cursor-pointer hover:bg-neutral-800/80">
                                            <a
                                                :href="category.url"
                                                class="text-sm font-medium text-neutral-100 hover:text-[#D4AF37]"
                                            >
                                                @{{ category.name }}
                                            </a>
                                        </div>

                                        <!-- Second Level Categories -->
                                        <div v-if="category.children && category.children.length">
                                            <div
                                                v-for="secondLevelCategory in category.children"
                                                :key="secondLevelCategory.id"
                                            >
                                                <div
                                                    class="flex items-center justify-between px-8 py-2 transition-colors duration-200 cursor-pointer hover:bg-neutral-800/80"
                                                    @click="showThirdLevel(secondLevelCategory, category, $event)"
                                                >
                                                    <a
                                                        :href="secondLevelCategory.url"
                                                        class="text-xs text-neutral-300 hover:text-[#D4AF37]"
                                                    >
                                                        @{{ secondLevelCategory.name }}
                                                    </a>

                                                    <span
                                                        v-if="secondLevelCategory.children && secondLevelCategory.children.length"
                                                        class="icon-arrow-right rtl:icon-arrow-left text-neutral-400 text-xs"
                                                    ></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Third level view -->
                            <div
                                class="flex-shrink-0 w-full h-full bg-[#121212]"
                                v-if="currentViewLevel === 'third'"
                            >
                                <div class="px-6 py-4 border-b border-[#C5A059]/20 bg-[#121212]">
                                    <button
                                        @click="goBackToMainView"
                                        class="flex items-center justify-center gap-2 text-neutral-200 hover:text-[#D4AF37] focus:outline-none"
                                        aria-label="Go back"
                                    >
                                        <span class="text-base icon-arrow-left rtl:icon-arrow-right"></span>

                                        <p class="text-sm font-medium">
                                            @lang('shop::app.components.layouts.header.desktop.bottom.back-button')
                                        </p>
                                    </button>
                                </div>

                                <!-- Third Level Content -->
                                <div class="py-4">
                                    <div
                                        v-for="thirdLevelCategory in currentSecondLevelCategory?.children"
                                        :key="thirdLevelCategory.id"
                                        class="mb-2"
                                    >
                                        <a
                                            :href="thirdLevelCategory.url"
                                            class="block px-6 py-2 text-xs text-neutral-300 hover:text-[#D4AF37] hover:bg-neutral-800/80 transition-colors"
                                        >
                                            @{{ thirdLevelCategory.name }}
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </x-slot>
            </x-shop::drawer>
        </div>
    </script>

    <script type="module">
        app.component('v-desktop-category', {
            template: '#v-desktop-category-template',

            data() {
                return {
                    isLoading: true,
                    categories: [],
                    isDrawerActive: false,
                    currentViewLevel: 'main',
                    currentSecondLevelCategory: null,
                    currentParentCategory: null
                }
            },

            mounted() {
                this.initCategories();
            },

            methods: {
                initCategories() {
                    try {
                        const stored = localStorage.getItem('categories');

                        if (stored) {
                            const parsed = JSON.parse(stored);
                            if (Array.isArray(parsed) && parsed.length > 0) {
                                this.categories = parsed;
                                this.isLoading = false;
                            }
                        }

                    } catch (e) {}

                    this.getCategories();
                },

                getCategories() {
                    this.$axios.get("{{ route('shop.api.categories.tree') }}")
                        .then(response => {
                            this.isLoading = false;
                            this.categories = response.data.data;
                            localStorage.setItem('categories', JSON.stringify(this.categories));
                        })
                        .catch(error => {
                            console.log(error);
                        });
                },

                pairCategoryChildren(category) {
                    if (! category.children) return [];

                    return category.children.reduce((result, value, index, array) => {
                        if (index % 2 === 0) {
                            result.push(array.slice(index, index + 2));
                        }
                        return result;
                    }, []);
                },

                toggleCategoryDrawer() {
                    this.isDrawerActive = !this.isDrawerActive;
                    if (this.isDrawerActive) {
                        this.currentViewLevel = 'main';
                    }
                },

                onDrawerToggle(event) {
                    this.isDrawerActive = event.isActive;
                },

                onDrawerClose(event) {
                    this.isDrawerActive = false;
                },

                showThirdLevel(secondLevelCategory, parentCategory, event) {
                    if (secondLevelCategory.children && secondLevelCategory.children.length) {
                        this.currentSecondLevelCategory = secondLevelCategory;
                        this.currentParentCategory = parentCategory;
                        this.currentViewLevel = 'third';

                        if (event) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                    }
                },

                goBackToMainView() {
                    this.currentViewLevel = 'main';
                }
            },
        });
    </script>
@endPushOnce
{!! view_render_event('bagisto.shop.components.layouts.header.desktop.bottom.after') !!}
