{!! view_render_event('bagisto.shop.layout.footer.before') !!}

<!-- Luxury Aniel's Flagship Footer -->
<footer class="bg-matteBlack text-ivory pt-16 pb-12 border-t border-champagneGold/20 font-sans selection:bg-champagneGold selection:text-matteBlack">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10 pb-12 border-b border-gray-800">
            <!-- Col 1: Brand & Boutique Address -->
            <div class="space-y-4">
                <a href="{{ route('shop.home.index') }}" class="flex items-center gap-3 py-1 group">
                    <img src="/logomain.png" alt="Aniel's Perfumery Logo" class="h-14 sm:h-16 w-auto object-contain drop-shadow-[0_2px_8px_rgba(197,160,89,0.4)] transition-transform duration-300 group-hover:scale-105">
                    <div class="flex flex-col text-left">
                        <span class="font-serif text-xl sm:text-2xl font-bold tracking-[0.25em] text-[#C5A059] leading-none">ANIEL'S</span>
                        <span class="text-[9px] tracking-[0.4em] uppercase text-gray-300 mt-1 font-semibold">P E R F U M E R Y</span>
                    </div>
                </a>
                <p class="text-xs text-gray-400 leading-relaxed font-light">
                    Nigeria's premier luxury digital flagship boutique. Curated authentic designer and niche Arabian extraits de parfum.
                </p>
                <div class="text-xs text-gray-300 space-y-1.5 pt-2">
                    <p class="font-semibold text-champagneGold">Operating Online (Abuja, Enugu & Lagos):</p>
                    <p class="text-gray-400">Opposite Trem Church Lifecamp,</p>
                    <p class="text-gray-400">Abuja, Nigeria.</p>
                </div>
            </div>

            <!-- Col 2: Navigation Links -->
            <div class="space-y-4">
                <h4 class="font-serif text-base font-bold text-champagneGold tracking-wider uppercase text-xs">Explore Aniel's</h4>
                <ul class="space-y-2.5 text-xs text-gray-400">
                    <li><a href="{{ route('shop.home.index') }}" class="hover:text-champagneGold transition-colors">Home Flagship</a></li>
                    <li><a href="{{ route('shop.search.index') }}" class="hover:text-champagneGold transition-colors">Shop All Fragrances</a></li>
                    <li><a href="{{ route('shop.home.why_aniels') }}" class="hover:text-champagneGold transition-colors">Why Aniel's (4 Pillars)</a></li>
                    <li><a href="{{ route('shop.home.our_story') }}" class="hover:text-champagneGold transition-colors">Our Story & Heritage</a></li>
                    <li><a href="{{ route('shop.scent_finder.index') }}" class="hover:text-champagneGold transition-colors">60-Sec Scent Finder</a></li>
                    <li><a href="{{ route('shop.home.index') }}#scent-journal" class="hover:text-champagneGold transition-colors">The Scent Journal</a></li>
                </ul>
            </div>

            <!-- Col 3: Customer Care & Direct Contact -->
            <div class="space-y-4">
                <h4 class="font-serif text-base font-bold text-champagneGold tracking-wider uppercase text-xs">Concierge & Support</h4>
                <ul class="space-y-2.5 text-xs text-gray-400">
                    <li class="flex items-center space-x-2">
                        <span class="text-champagneGold font-bold">WhatsApp:</span>
                        <a href="https://wa.me/2348123428579" target="_blank" class="hover:text-champagneGold transition-colors">+234 812 342 8579</a>
                    </li>
                    <li class="flex items-center space-x-2">
                        <span class="text-champagneGold font-bold">Instagram:</span>
                        <a href="https://instagram.com/Aniels_perfumery" target="_blank" class="hover:text-champagneGold transition-colors">@Aniels_perfumery</a>
                    </li>
                    <li><a href="{{ route('shop.cms.page', 'privacy-policy') }}" class="hover:text-champagneGold transition-colors">Privacy Policy</a></li>
                    <li><a href="{{ route('shop.cms.page', 'return-policy') }}" class="hover:text-champagneGold transition-colors">Shipping & Return Policy</a></li>
                    <li><a href="{{ route('shop.cms.page', 'terms-conditions') }}" class="hover:text-champagneGold transition-colors">Terms of Service</a></li>
                </ul>
            </div>

            <!-- Col 4: Exclusive Scent Club Newsletter -->
            <div class="space-y-4">
                <h4 class="font-serif text-base font-bold text-champagneGold tracking-wider uppercase text-xs">The Scent Club</h4>
                <p class="text-xs text-gray-400 leading-relaxed font-light">
                    Subscribe for private vault drops, exclusive restock alerts, and VIP olfactory recommendations.
                </p>
                <form class="space-y-2" onsubmit="event.preventDefault(); alert('Thank you for subscribing to Aniel\'s Private Scent Vault.');">
                    <input type="email" placeholder="Enter your email address" required class="w-full px-4 py-2.5 bg-gray-900 border border-gray-800 text-xs text-ivory placeholder-gray-500 rounded focus:border-champagneGold focus:outline-none transition-colors">
                    <button type="submit" class="w-full py-2.5 bg-champagneGold text-matteBlack uppercase tracking-widest text-xs font-bold rounded hover:bg-white transition-colors">
                        Join The Vault
                    </button>
                </form>
            </div>
        </div>

        <!-- Bottom Copyright -->
        <div class="pt-8 flex flex-col sm:flex-row items-center justify-between text-[11px] text-gray-500 space-y-4 sm:space-y-0">
            <p>&copy; {{ date('Y') }} Aniel's Perfumery. All Rights Reserved. Powered by <a href="https://www.jexeltech.com" target="_blank" class="hover:text-champagneGold transition-colors underline font-medium">Jexel Core Technologies</a>.</p>
            <div class="flex items-center space-x-4">
                <span class="text-gray-400">100% Authentic Sourcing</span>
                <span class="text-gray-600">•</span>
                <span class="text-gray-400">Nationwide Express Delivery</span>
            </div>
        </div>
    </div>
</footer>

{!! view_render_event('bagisto.shop.layout.footer.after') !!}
