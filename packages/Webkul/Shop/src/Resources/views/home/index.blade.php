@php
    $channel = core()->getCurrentChannel();
@endphp

<!-- SEO Meta Content -->
@push ('meta')
    <meta
        name="title"
        content="{{ $channel->home_seo['meta_title'] ?? 'Aniel\'s Perfumery — Luxury Digital Flagship' }}"
    />

    <meta
        name="description"
        content="{{ $channel->home_seo['meta_description'] ?? 'Curated authentic designer and niche Arabian fragrances delivered across Nigeria.' }}"
    />

    <meta
        name="keywords"
        content="{{ $channel->home_seo['meta_keywords'] ?? 'perfume, fragrances, lattafa, aniels, enugu, luxury perfumes' }}"
    />
@endPush

<x-shop::layouts>
    <x-slot:title>
        Aniel's Perfumery — Luxury Digital Flagship
    </x-slot>

    <!-- Complete 13-Section Editorial Flagship Homepage -->
    <div class="bg-ivory text-matteBlack font-sans selection:bg-champagneGold selection:text-matteBlack">
        
        <!-- SECTION 1: HERO SECTION -->
        <header class="relative min-h-[85vh] flex items-center justify-center overflow-hidden bg-ivory text-matteBlack border-b border-champagneGold/20">
            <div class="absolute inset-0 z-0 bg-cover bg-center opacity-30 mix-blend-multiply transition-opacity duration-700" style="background-image: url('https://images.unsplash.com/photo-1615655406736-b37c4fabf923?auto=format&fit=crop&q=80&w=1920');"></div>
            <div class="absolute inset-0 bg-gradient-to-t from-ivory via-ivory/70 to-transparent z-1"></div>
            
            <div class="relative z-2 max-w-4xl mx-auto px-4 text-center mt-8">
                <span class="text-xs uppercase tracking-[0.4em] text-champagneGold font-semibold mb-4 block">Aniel's Signature Experience</span>
                <h1 class="font-serif text-4xl sm:text-6xl lg:text-7xl font-extralight tracking-tight leading-tight text-matteBlack mb-6">
                    Every Fragrance Tells a Story. <br>
                    <span class="italic font-normal text-champagneGold">Discover the scent people will remember you by.</span>
                </h1>
                <p class="text-gray-600 max-w-xl mx-auto text-sm sm:text-base leading-relaxed tracking-wide font-light mb-10">
                    Curated authentic designer and niche Arabian fragrances delivered across Nigeria from our flagship boutique in Enugu.
                </p>
                <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
                    <a href="{{ route('shop.scent_finder.index') }}" class="w-full sm:w-auto px-8 py-4 bg-matteBlack text-ivory uppercase tracking-widest text-xs font-bold rounded shadow-lg hover:bg-champagneGold hover:text-matteBlack transition-all duration-300">
                        Find Your Signature Scent
                    </a>
                    <a href="{{ route('shop.search.index') }}" class="w-full sm:w-auto px-8 py-4 border border-champagneGold text-matteBlack hover:bg-softChampagne uppercase tracking-widest text-xs font-semibold rounded transition-all duration-300">
                        Explore the Shop
                    </a>
                </div>
            </div>
        </header>

        <!-- SECTION 2: BRAND PILLARS / TRUST BADGES BAR -->
        <div class="bg-softBeige py-6 border-b border-champagneGold/20">
            <div class="max-w-7xl mx-auto px-4 flex flex-wrap justify-center gap-6 md:gap-12 text-xs uppercase tracking-widest text-matteBlack font-semibold">
                <div class="flex items-center space-x-2 text-champagneGold">
                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/></svg>
                    <span>100% Authentic Fragrances Guaranteed</span>
                </div>
                <div class="flex items-center space-x-2">
                    <span class="w-1.5 h-1.5 bg-champagneGold rounded-full"></span>
                    <span>Curated Performance Metrics</span>
                </div>
                <div class="flex items-center space-x-2">
                    <span class="w-1.5 h-1.5 bg-champagneGold rounded-full"></span>
                    <span>Swift Shipping from Enugu</span>
                </div>
                <div class="flex items-center space-x-2">
                    <span class="w-1.5 h-1.5 bg-champagneGold rounded-full"></span>
                    <span>Luxury Unboxing Experience</span>
                </div>
            </div>
        </div>

        <!-- SECTION 3: SHOP BY MOOD -->
        <section class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 border-b border-champagneGold/10">
            <div class="text-center mb-16">
                <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Curated Moods</span>
                <h2 class="font-serif text-3xl sm:text-5xl font-light text-matteBlack">Discover Your Aura</h2>
                <div class="w-16 h-[1px] bg-champagneGold mx-auto mt-4"></div>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <a href="{{ route('shop.search.index') }}?query=bold" class="group block border border-champagneGold/20 hover:border-champagneGold rounded-lg overflow-hidden transition-all bg-white shadow-sm">
                    <div class="h-64 bg-cover bg-center group-hover:scale-105 transition-transform duration-700" style="background-image: url('https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&q=80&w=600');"></div>
                    <div class="p-8 text-center bg-white">
                        <h3 class="font-serif text-2xl mb-2 text-matteBlack">Bold & Commanding</h3>
                        <p class="text-xs text-gray-500 uppercase tracking-widest">Oud, Leather, Spice</p>
                    </div>
                </a>
                <a href="{{ route('shop.search.index') }}?query=fresh" class="group block border border-champagneGold/20 hover:border-champagneGold rounded-lg overflow-hidden transition-all bg-white shadow-sm">
                    <div class="h-64 bg-cover bg-center group-hover:scale-105 transition-transform duration-700" style="background-image: url('https://images.unsplash.com/photo-1523293182086-7651a899d37f?auto=format&fit=crop&q=80&w=600');"></div>
                    <div class="p-8 text-center bg-white">
                        <h3 class="font-serif text-2xl mb-2 text-matteBlack">Clean & Vibrant</h3>
                        <p class="text-xs text-gray-500 uppercase tracking-widest">Citrus, Aquatic, Green</p>
                    </div>
                </a>
                <a href="{{ route('shop.search.index') }}?query=sweet" class="group block border border-champagneGold/20 hover:border-champagneGold rounded-lg overflow-hidden transition-all bg-white shadow-sm">
                    <div class="h-64 bg-cover bg-center group-hover:scale-105 transition-transform duration-700" style="background-image: url('https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&q=80&w=600');"></div>
                    <div class="p-8 text-center bg-white">
                        <h3 class="font-serif text-2xl mb-2 text-matteBlack">Sweet & Alluring</h3>
                        <p class="text-xs text-gray-500 uppercase tracking-widest">Vanilla, Amber, Gourmand</p>
                    </div>
                </a>
            </div>
        </section>

        <!-- SECTION 4: SHOP BY OCCASION -->
        <section class="py-20 bg-softBeige/30 border-b border-champagneGold/10">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-12">
                    <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Occasion Matcher</span>
                    <h2 class="font-serif text-3xl sm:text-4xl font-light text-matteBlack">Scents Built For The Right Setting</h2>
                    <div class="w-16 h-[1px] bg-champagneGold mx-auto mt-4"></div>
                </div>
                <div class="grid grid-cols-2 md:grid-cols-5 gap-4">
                    <a href="{{ route('shop.search.index') }}?query=office" class="p-6 bg-white border border-champagneGold/20 rounded-lg text-center hover:border-champagneGold transition-all">
                        <h4 class="font-serif text-base font-bold text-matteBlack mb-1">Office-Friendly</h4>
                        <p class="text-[10px] text-gray-500">Non-offensive projection</p>
                    </a>
                    <a href="{{ route('shop.search.index') }}?query=date" class="p-6 bg-white border border-champagneGold/20 rounded-lg text-center hover:border-champagneGold transition-all">
                        <h4 class="font-serif text-base font-bold text-matteBlack mb-1">Date Night</h4>
                        <p class="text-[10px] text-gray-500">Hypnotic alluring trail</p>
                    </a>
                    <a href="{{ route('shop.search.index') }}?query=wedding" class="p-6 bg-white border border-champagneGold/20 rounded-lg text-center hover:border-champagneGold transition-all">
                        <h4 class="font-serif text-base font-bold text-matteBlack mb-1">Weddings</h4>
                        <p class="text-[10px] text-gray-500">Heavy luxury status</p>
                    </a>
                    <a href="{{ route('shop.search.index') }}?query=everyday" class="p-6 bg-white border border-champagneGold/20 rounded-lg text-center hover:border-champagneGold transition-all">
                        <h4 class="font-serif text-base font-bold text-matteBlack mb-1">Everyday Wear</h4>
                        <p class="text-[10px] text-gray-500">Versatile daily wear</p>
                    </a>
                    <a href="{{ route('shop.search.index') }}?query=gift" class="p-6 bg-white border border-champagneGold/20 rounded-lg text-center hover:border-champagneGold transition-all col-span-2 md:col-span-1">
                        <h4 class="font-serif text-base font-bold text-matteBlack mb-1">Perfume Gifts</h4>
                        <p class="text-[10px] text-gray-500">Curated box sets</p>
                    </a>
                </div>
            </div>
        </section>

        <!-- SECTION 5: FEATURED COLLECTIONS SHOWCASE -->
        <section class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 border-b border-champagneGold/10">
            <div class="flex flex-col md:flex-row items-center justify-between mb-12">
                <div>
                    <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Curated Curation</span>
                    <h2 class="font-serif text-3xl sm:text-4xl font-light text-matteBlack">Featured Fragrance Houses</h2>
                </div>
                <div class="mt-4 md:mt-0 flex space-x-3 text-xs uppercase tracking-widest font-semibold">
                    <a href="{{ route('shop.search.index') }}" class="px-4 py-2 bg-matteBlack text-ivory rounded">Best Sellers</a>
                    <a href="{{ route('shop.search.index') }}" class="px-4 py-2 border border-champagneGold text-matteBlack rounded hover:bg-softChampagne">New Arrivals</a>
                </div>
            </div>
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <!-- Fragrance Card 1 -->
                <div class="p-6 bg-white rounded-lg border border-champagneGold/20 shadow-sm hover:border-champagneGold transition-all">
                    <div class="h-48 bg-cover bg-center rounded mb-4" style="background-image: url('https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&q=80&w=400');"></div>
                    <span class="text-[10px] text-champagneGold font-bold uppercase tracking-wider block mb-1">Aniel's Signature</span>
                    <h3 class="font-serif text-lg font-bold text-matteBlack mb-1">Signature Oud Extrait</h3>
                    <p class="text-xs font-semibold text-matteBlack mb-4">₦85,000</p>
                    <a href="{{ route('shop.search.index') }}" class="w-full py-2.5 bg-matteBlack text-ivory text-xs font-bold uppercase tracking-widest rounded block text-center hover:bg-champagneGold hover:text-matteBlack transition-colors">View Product</a>
                </div>
                <!-- Fragrance Card 2 -->
                <div class="p-6 bg-white rounded-lg border border-champagneGold/20 shadow-sm hover:border-champagneGold transition-all">
                    <div class="h-48 bg-cover bg-center rounded mb-4" style="background-image: url('https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&q=80&w=400');"></div>
                    <span class="text-[10px] text-champagneGold font-bold uppercase tracking-wider block mb-1">Lattafa</span>
                    <h3 class="font-serif text-lg font-bold text-matteBlack mb-1">Yara Rose EDP</h3>
                    <p class="text-xs font-semibold text-matteBlack mb-4">₦42,000</p>
                    <a href="{{ route('shop.search.index') }}" class="w-full py-2.5 bg-matteBlack text-ivory text-xs font-bold uppercase tracking-widest rounded block text-center hover:bg-champagneGold hover:text-matteBlack transition-colors">View Product</a>
                </div>
                <!-- Fragrance Card 3 -->
                <div class="p-6 bg-white rounded-lg border border-champagneGold/20 shadow-sm hover:border-champagneGold transition-all">
                    <div class="h-48 bg-cover bg-center rounded mb-4" style="background-image: url('https://images.unsplash.com/photo-1523293182086-7651a899d37f?auto=format&fit=crop&q=80&w=400');"></div>
                    <span class="text-[10px] text-champagneGold font-bold uppercase tracking-wider block mb-1">Afnan</span>
                    <h3 class="font-serif text-lg font-bold text-matteBlack mb-1">Turathi Blue EDP</h3>
                    <p class="text-xs font-semibold text-matteBlack mb-4">₦48,000</p>
                    <a href="{{ route('shop.search.index') }}" class="w-full py-2.5 bg-matteBlack text-ivory text-xs font-bold uppercase tracking-widest rounded block text-center hover:bg-champagneGold hover:text-matteBlack transition-colors">View Product</a>
                </div>
                <!-- Fragrance Card 4 -->
                <div class="p-6 bg-white rounded-lg border border-champagneGold/20 shadow-sm hover:border-champagneGold transition-all">
                    <div class="h-48 bg-cover bg-center rounded mb-4" style="background-image: url('https://images.unsplash.com/photo-1547887537-6158d64c35b3?auto=format&fit=crop&q=80&w=400');"></div>
                    <span class="text-[10px] text-champagneGold font-bold uppercase tracking-wider block mb-1">Maison Alhambra</span>
                    <h3 class="font-serif text-lg font-bold text-matteBlack mb-1">Kismet For Men</h3>
                    <p class="text-xs font-semibold text-matteBlack mb-4">₦39,000</p>
                    <a href="{{ route('shop.search.index') }}" class="w-full py-2.5 bg-matteBlack text-ivory text-xs font-bold uppercase tracking-widest rounded block text-center hover:bg-champagneGold hover:text-matteBlack transition-colors">View Product</a>
                </div>
            </div>
        </section>

        <!-- SECTION 6: "WHY ANIEL'S" HIGH-LEVEL SUMMARY BLOCK -->
        <section class="py-20 bg-softBeige/30 border-b border-champagneGold/20">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                <span class="text-xs uppercase tracking-[0.4em] text-champagneGold font-semibold mb-2 block">The Aniel's Difference</span>
                <h2 class="font-serif text-3xl sm:text-5xl font-light text-matteBlack mb-6">Why Discerning Perfume Lovers Choose Aniel's</h2>
                <p class="max-w-3xl mx-auto text-gray-600 text-sm sm:text-base leading-relaxed mb-8 font-light">
                    From 100% direct original sourcing for top Arabian and designer houses to our climate-resilience testing, we take the guesswork out of luxury fragrance buying across Nigeria.
                </p>
                <div class="grid grid-cols-1 sm:grid-cols-3 gap-6 text-left max-w-5xl mx-auto mb-10">
                    <div class="p-6 bg-white rounded border border-champagneGold/20 shadow-sm">
                        <span class="text-champagneGold font-bold text-lg font-serif mb-2 block">100% Authentic</span>
                        <p class="text-xs text-gray-500">Guaranteed original bottles sourced directly from verified distributors.</p>
                    </div>
                    <div class="p-6 bg-white rounded border border-champagneGold/20 shadow-sm">
                        <span class="text-champagneGold font-bold text-lg font-serif mb-2 block">Tested Longevity</span>
                        <p class="text-xs text-gray-500">Every scent rated for fabric retention and sillage projection.</p>
                    </div>
                    <div class="p-6 bg-white rounded border border-champagneGold/20 shadow-sm">
                        <span class="text-champagneGold font-bold text-lg font-serif mb-2 block">Enugu Dispatch</span>
                        <p class="text-xs text-gray-500">Rapid nationwide shipping with shock-proof luxury protective packaging.</p>
                    </div>
                </div>
                <a href="{{ route('shop.home.why_aniels') }}" class="inline-block px-8 py-4 bg-matteBlack text-ivory uppercase tracking-widest text-xs font-bold rounded shadow-lg hover:bg-champagneGold hover:text-matteBlack transition-all duration-300">
                    Discover Why Aniel's
                </a>
            </div>
        </section>

        <!-- SECTION 7: "OUR STORY" HIGHLIGHT & FOUNDER INTRO -->
        <section class="py-24 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 border-b border-champagneGold/10 bg-ivory">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                <div class="relative rounded-lg overflow-hidden border border-champagneGold/20 h-96 shadow-xl">
                    <img src="https://images.unsplash.com/photo-1592945403244-b3fbafd7f539?auto=format&fit=crop&q=80&w=1000" alt="Aniel's Flagship Boutique" class="w-full h-full object-cover">
                    <div class="absolute inset-0 bg-gradient-to-t from-matteBlack/80 to-transparent"></div>
                    <div class="absolute bottom-6 left-6 right-6 text-ivory">
                        <span class="text-[10px] uppercase tracking-widest text-champagneGold">Flagship Concept Store</span>
                        <h4 class="font-serif text-lg font-bold">Independence Layout, Enugu</h4>
                    </div>
                </div>
                <div>
                    <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Our Heritage</span>
                    <h2 class="font-serif text-3xl sm:text-4xl font-light mb-6 text-matteBlack">Born from a Passion for Unforgettable Scents</h2>
                    <p class="text-gray-600 text-sm leading-relaxed mb-6">
                        Aniel's Perfumery was founded with a singular conviction: fragrance is a personal signature, not a mere grocery commodity. We source exceptional formulation structures with exquisite longevity parameters so that our customers experience authentic self-expression.
                    </p>
                    <blockquote class="border-l-2 border-champagneGold pl-4 italic text-sm text-gray-700 font-serif mb-6">
                        "...smell like a million bucks without breaking the bank."
                    </blockquote>
                    <a href="{{ route('shop.home.our_story') }}" class="inline-block px-6 py-3 border border-champagneGold text-matteBlack hover:bg-champagneGold hover:text-matteBlack uppercase tracking-widest text-xs font-semibold rounded transition-all duration-300">
                        Read Our Full Story
                    </a>
                </div>
            </div>
        </section>

        <!-- SECTION 8: INTERACTIVE SCENT FINDER TEASER -->
        <section id="scent-finder" class="py-20 bg-softBeige/40 border-b border-champagneGold/10">
            <div class="max-w-4xl mx-auto px-4 text-center">
                <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Interactive Experience</span>
                <h2 class="font-serif text-3xl sm:text-4xl font-light text-matteBlack mb-4">60-Second Signature Scent Quiz</h2>
                <p class="text-xs sm:text-sm text-gray-600 max-w-xl mx-auto mb-8">
                    Answer 3 quick questions about your preferred vibe, occasion, and climate suitability to match with your ideal olfactory profile.
                </p>
                <a href="{{ route('shop.scent_finder.index') }}" class="inline-block px-8 py-4 bg-matteBlack text-ivory uppercase tracking-widest text-xs font-bold rounded shadow-lg hover:bg-champagneGold hover:text-matteBlack transition-all">
                    Start Scent Finder Quiz
                </a>
            </div>
        </section>

        <!-- SECTION 9: CUSTOMER TESTIMONIALS & REVIEWS GRID -->
        <section class="py-20 bg-ivory border-b border-champagneGold/20">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-14">
                    <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Client Reviews</span>
                    <h2 class="font-serif text-3xl sm:text-4xl font-light text-matteBlack">Loved Across Nigeria</h2>
                    <div class="w-16 h-[1px] bg-champagneGold mx-auto mt-4"></div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="p-8 bg-white rounded-lg border border-champagneGold/20 shadow-sm">
                        <div class="flex text-champagneGold mb-4">★★★★★</div>
                        <p class="text-xs text-gray-600 italic leading-relaxed mb-6">
                            "Ordered Turathi Blue to Lagos. It arrived in 48 hours perfectly wrapped with zero leakage. The longevity in our heat is insane!"
                        </p>
                        <div class="font-serif text-sm font-bold text-matteBlack">— Dr. Chuka O., Lagos</div>
                    </div>
                    <div class="p-8 bg-white rounded-lg border border-champagneGold/20 shadow-sm">
                        <div class="flex text-champagneGold mb-4">★★★★★</div>
                        <p class="text-xs text-gray-600 italic leading-relaxed mb-6">
                            "Aniel's Signature Oud got me 5 compliments on my wedding day in Enugu. Truly 100% authentic luxury performance."
                        </p>
                        <div class="font-serif text-sm font-bold text-matteBlack">— Amaka E., Enugu</div>
                    </div>
                    <div class="p-8 bg-white rounded-lg border border-champagneGold/20 shadow-sm">
                        <div class="flex text-champagneGold mb-4">★★★★★</div>
                        <p class="text-xs text-gray-600 italic leading-relaxed mb-6">
                            "The Scent Finder quiz matched me with Yara Rose. Best customer experience I've had buying fragrance online in Abuja."
                        </p>
                        <div class="font-serif text-sm font-bold text-matteBlack">— Fatima B., Abuja</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- SECTION 10: THE SCENT JOURNAL (BLOG PREVIEW) -->
        <section id="scent-journal" class="py-24 bg-softBeige border-b border-champagneGold/10">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-16">
                    <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">The Scent Journal</span>
                    <h2 class="font-serif text-3xl sm:text-5xl font-light text-matteBlack">Fragrance Chronicles & Guides</h2>
                    <div class="w-16 h-[1px] bg-champagneGold mx-auto mt-4"></div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <!-- Article 1 -->
                    <div class="group bg-white border border-champagneGold/10 rounded-lg overflow-hidden hover:border-champagneGold/40 transition-colors shadow-sm">
                        <div class="h-48 bg-cover bg-center group-hover:scale-105 transition-transform duration-500" style="background-image: url('https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&q=80&w=600');"></div>
                        <div class="p-6">
                            <span class="text-[10px] text-champagneGold tracking-widest uppercase font-semibold">FRAGRANCE TIPS</span>
                            <h3 class="font-serif text-lg mt-2 mb-3 leading-snug group-hover:text-champagneGold transition-colors text-matteBlack">How to Maximize Longevity in West African Heat</h3>
                            <p class="text-xs text-gray-600 line-clamp-3 leading-relaxed">
                                A complete guide on targeting pulse points and layering with custom matching oil bases to maintain performance all through humid tropical seasons.
                            </p>
                        </div>
                    </div>
                    <!-- Article 2 -->
                    <div class="group bg-white border border-champagneGold/10 rounded-lg overflow-hidden hover:border-champagneGold/40 transition-colors shadow-sm">
                        <div class="h-48 bg-cover bg-center group-hover:scale-105 transition-transform duration-500" style="background-image: url('https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&q=80&w=600');"></div>
                        <div class="p-6">
                            <span class="text-[10px] text-champagneGold tracking-widest uppercase font-semibold">EDUCATION</span>
                            <h3 class="font-serif text-lg mt-2 mb-3 leading-snug group-hover:text-champagneGold transition-colors text-matteBlack">Top, Middle & Base Notes: The Olfactory Shift</h3>
                            <p class="text-xs text-gray-600 line-clamp-3 leading-relaxed">
                                Discover why a fragrance smelling of fresh bergamot inside your first ten minutes transforms into warm majestic amber and oud four hours later.
                            </p>
                        </div>
                    </div>
                    <!-- Article 3 -->
                    <div class="group bg-white border border-champagneGold/10 rounded-lg overflow-hidden hover:border-champagneGold/40 transition-colors shadow-sm">
                        <div class="h-48 bg-cover bg-center group-hover:scale-105 transition-transform duration-500" style="background-image: url('https://images.unsplash.com/photo-1547887537-6158d64c35b3?auto=format&fit=crop&q=80&w=600');"></div>
                        <div class="p-6">
                            <span class="text-[10px] text-champagneGold tracking-widest uppercase font-semibold">BUYING GUIDES</span>
                            <h3 class="font-serif text-lg mt-2 mb-3 leading-snug group-hover:text-champagneGold transition-colors text-matteBlack">Decoding Inspired Perfumes: Exceptional Value</h3>
                            <p class="text-xs text-gray-600 line-clamp-3 leading-relaxed">
                                Unpack the modern manufacturing techniques of elite houses like Maison Alhambra and Lattafa in capturing high-end niche formulas elegantly.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- SECTION 11: INSTAGRAM / TIKTOK CONTENT FEED GRID -->
        <section class="py-20 bg-ivory border-b border-champagneGold/10">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-12">
                    <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Follow Our Journey</span>
                    <h2 class="font-serif text-3xl sm:text-4xl font-light text-matteBlack">@Aniels_perfumery on Instagram & TikTok</h2>
                </div>
                <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                    <div class="relative h-64 rounded-lg overflow-hidden border border-champagneGold/20 group">
                        <img src="https://images.unsplash.com/photo-1541643600914-78b084683601?auto=format&fit=crop&q=80&w=400" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" alt="Scent Unboxing">
                        <div class="absolute inset-0 bg-matteBlack/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-ivory text-xs font-bold">Unboxing Reel</div>
                    </div>
                    <div class="relative h-64 rounded-lg overflow-hidden border border-champagneGold/20 group">
                        <img src="https://images.unsplash.com/photo-1594035910387-fea47794261f?auto=format&fit=crop&q=80&w=400" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" alt="Arabian Collection">
                        <div class="absolute inset-0 bg-matteBlack/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-ivory text-xs font-bold">Arabian Elixirs</div>
                    </div>
                    <div class="relative h-64 rounded-lg overflow-hidden border border-champagneGold/20 group">
                        <img src="https://images.unsplash.com/photo-1523293182086-7651a899d37f?auto=format&fit=crop&q=80&w=400" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" alt="Boutique Showcase">
                        <div class="absolute inset-0 bg-matteBlack/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-ivory text-xs font-bold">Enugu Store Vibes</div>
                    </div>
                    <div class="relative h-64 rounded-lg overflow-hidden border border-champagneGold/20 group">
                        <img src="https://images.unsplash.com/photo-1547887537-6158d64c35b3?auto=format&fit=crop&q=80&w=400" class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500" alt="Luxury Bottles">
                        <div class="absolute inset-0 bg-matteBlack/40 opacity-0 group-hover:opacity-100 transition-opacity flex items-center justify-center text-ivory text-xs font-bold">Compliment Getters</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- SECTION 12: NEWSLETTER SUBSCRIPTION BOX -->
        <section class="py-20 bg-softBeige">
            <div class="max-w-3xl mx-auto px-4 text-center">
                <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold mb-2 block">Join The Scent Club</span>
                <h2 class="font-serif text-3xl sm:text-4xl font-light text-matteBlack mb-4">Exclusive Drops & Restock Alerts</h2>
                <p class="text-xs sm:text-sm text-gray-600 mb-8">
                    Be the first to receive notifications on limited Arabian imports, luxury extraits, and scent pairing tips.
                </p>
                <div class="flex max-w-md mx-auto">
                    <input type="email" placeholder="Enter your email address" class="bg-white border border-champagneGold/30 px-4 py-3 text-xs text-matteBlack focus:outline-none focus:border-champagneGold rounded-l w-full">
                    <button class="bg-matteBlack text-ivory px-6 py-3 text-xs uppercase font-bold tracking-widest rounded-r hover:bg-champagneGold hover:text-matteBlack transition-colors">Join</button>
                </div>
            </div>
        </section>

    </div>
</x-shop::layouts>
