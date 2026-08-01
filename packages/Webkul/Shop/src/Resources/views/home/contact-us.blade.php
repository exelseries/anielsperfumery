<x-shop::layouts>
    <x-slot:title>
        Contact Us — Aniel's Perfumery
    </x-slot>

    <div class="py-16 bg-ivory min-h-[70vh]">
        <div class="max-w-3xl mx-auto px-4 sm:px-6">
            <div class="bg-white rounded-2xl border border-champagneGold/30 p-8 sm:p-12 shadow-lg">
                <div class="text-center mb-10">
                    <span class="text-xs uppercase tracking-[0.3em] text-champagneGold font-semibold block mb-2">Concierge & Support</span>
                    <h1 class="font-serif text-3xl sm:text-5xl font-light text-matteBlack mb-3">Get in Touch</h1>
                    <p class="text-xs sm:text-sm text-gray-500 font-light max-w-md mx-auto">
                        Jot us a note, and our fragrance concierge will get back to you as quickly as possible.
                    </p>
                </div>

                @if (session('success'))
                    <div class="mb-8 p-4 bg-green-50 border border-green-200 text-green-800 text-xs sm:text-sm rounded-lg text-center font-medium">
                        {{ session('success') }}
                    </div>
                @endif

                <form action="{{ route('shop.home.contact_us.send_mail') }}" method="POST" class="space-y-6">
                    @csrf

                    <!-- Name -->
                    <div>
                        <label class="block text-xs font-semibold uppercase tracking-wider text-matteBlack mb-2">
                            Your Full Name <span class="text-red-500">*</span>
                        </label>
                        <input
                            type="text"
                            name="name"
                            required
                            value="{{ old('name') }}"
                            placeholder="Enter your name"
                            class="w-full px-5 py-4 bg-ivory/40 border border-gray-300 rounded-lg text-sm focus:outline-none focus:border-champagneGold transition-colors"
                        />
                        @error('name')
                            <p class="mt-1 text-xs text-red-500">{{ $message }}</p>
                        @enderror
                    </div>

                    <!-- Email -->
                    <div>
                        <label class="block text-xs font-semibold uppercase tracking-wider text-matteBlack mb-2">
                            Email Address <span class="text-red-500">*</span>
                        </label>
                        <input
                            type="email"
                            name="email"
                            required
                            value="{{ old('email') }}"
                            placeholder="Enter your email"
                            class="w-full px-5 py-4 bg-ivory/40 border border-gray-300 rounded-lg text-sm focus:outline-none focus:border-champagneGold transition-colors"
                        />
                        @error('email')
                            <p class="mt-1 text-xs text-red-500">{{ $message }}</p>
                        @enderror
                    </div>

                    <!-- Phone Number -->
                    <div>
                        <label class="block text-xs font-semibold uppercase tracking-wider text-matteBlack mb-2">
                            Phone / WhatsApp Number
                        </label>
                        <input
                            type="text"
                            name="contact"
                            value="{{ old('contact') }}"
                            placeholder="+234..."
                            class="w-full px-5 py-4 bg-ivory/40 border border-gray-300 rounded-lg text-sm focus:outline-none focus:border-champagneGold transition-colors"
                        />
                    </div>

                    <!-- Message -->
                    <div>
                        <label class="block text-xs font-semibold uppercase tracking-wider text-matteBlack mb-2">
                            Message <span class="text-red-500">*</span>
                        </label>
                        <textarea
                            name="message"
                            required
                            rows="6"
                            placeholder="Describe your inquiry, order details, or fragrance question..."
                            class="w-full px-5 py-4 bg-ivory/40 border border-gray-300 rounded-lg text-sm focus:outline-none focus:border-champagneGold transition-colors resize-y"
                        >{{ old('message') }}</textarea>
                        @error('message')
                            <p class="mt-1 text-xs text-red-500">{{ $message }}</p>
                        @enderror
                    </div>

                    <!-- Submit Button -->
                    <div class="pt-4 text-center">
                        <button
                            type="submit"
                            class="w-full sm:w-auto px-10 py-4 bg-matteBlack text-ivory uppercase tracking-widest text-xs font-bold rounded-lg shadow-lg hover:bg-champagneGold hover:text-matteBlack transition-all duration-300"
                        >
                            Send Message
                        </button>
                    </div>
                </form>

                <!-- Direct Contact Alternatives -->
                <div class="mt-12 pt-8 border-t border-gray-100 grid grid-cols-1 sm:grid-cols-2 gap-6 text-center text-xs">
                    <div class="p-4 bg-softBeige/30 rounded-lg border border-champagneGold/20">
                        <span class="text-champagneGold font-bold block mb-1">WhatsApp Direct Concierge</span>
                        <a href="https://wa.me/2348123428579" target="_blank" class="text-matteBlack font-semibold hover:underline">+234 812 342 8579</a>
                    </div>
                    <div class="p-4 bg-softBeige/30 rounded-lg border border-champagneGold/20">
                        <span class="text-champagneGold font-bold block mb-1">Instagram Concierge</span>
                        <a href="https://instagram.com/Aniels_perfumery" target="_blank" class="text-matteBlack font-semibold hover:underline">@Aniels_perfumery</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-shop::layouts>
