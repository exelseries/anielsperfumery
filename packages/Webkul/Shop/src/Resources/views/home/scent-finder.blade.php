<x-shop::layouts>
    <x-slot:title>
        Signature Scent Finder Quiz — Aniel's Perfumery
    </x-slot>

    <div class="bg-[#FAF8F5] text-[#121212] font-sans selection:bg-[#C5A059] selection:text-[#121212] min-h-screen py-10">
        
        <!-- QUIZ CONTAINER -->
        <div class="max-w-4xl mx-auto px-4 sm:px-6">
            
            <!-- HEADER -->
            <div class="text-center mb-10">
                <span class="text-xs uppercase tracking-[0.35em] text-[#C5A059] font-bold block mb-2">Automated Olfactory Consultation</span>
                <h1 class="font-serif text-3xl sm:text-5xl font-light text-[#121212] mb-3">
                    Discover Your Signature Scent
                </h1>
                <p class="text-xs sm:text-sm text-gray-600 max-w-xl mx-auto font-light leading-relaxed">
                    Answer 4 quick questions about your style, occasion, and climate performance expectations to reveal your top 3 fragrance matches.
                </p>
                <div class="w-16 h-0.5 bg-[#C5A059] mx-auto mt-4"></div>
            </div>

            <!-- PROGRESS BAR (Steps 1-4) -->
            <div id="quiz-progress-container" class="mb-10 max-w-xl mx-auto">
                <div class="flex items-center justify-between text-[11px] font-semibold text-gray-500 uppercase tracking-widest mb-2">
                    <span id="quiz-step-label">Step 1 of 4</span>
                    <span id="quiz-topic-label">Mood & Aura</span>
                </div>
                <div class="w-full h-1.5 bg-gray-200 rounded-full overflow-hidden">
                    <div id="quiz-progress-bar" class="h-full bg-[#C5A059] transition-all duration-500 w-1/4"></div>
                </div>
            </div>

            <!-- STEP 1: MOOD / VIBE -->
            <div id="step-1" class="quiz-step bg-white p-8 sm:p-12 rounded-3xl border border-[#C5A059]/30 shadow-md">
                <h2 class="font-serif text-2xl sm:text-3xl font-light text-[#121212] text-center mb-2">1. How do you want your fragrance to make you feel?</h2>
                <p class="text-xs text-gray-500 text-center mb-8 uppercase tracking-wider">Select your primary mood aura</p>
                
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <button type="button" onclick="selectMood('bold')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Bold & Commanding</span>
                            <span class="text-xl">👑</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">Rich Oud, Dark Leather, Warm Amber & Exotic Spices.</p>
                    </button>

                    <button type="button" onclick="selectMood('fresh')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Fresh & Clean</span>
                            <span class="text-xl">🌊</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">Sparkling Citrus, Aquatic Sea Salt, Green Mint & White Musk.</p>
                    </button>

                    <button type="button" onclick="selectMood('sweet')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Sweet & Gourmand</span>
                            <span class="text-xl">✨</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">Bourbon Vanilla, Caramel, Roasted Coffee & Creamy Tonka.</p>
                    </button>

                    <button type="button" onclick="selectMood('floral')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Romantic & Floral</span>
                            <span class="text-xl">🌹</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">Velvet Rose, Blooming Jasmine, Neroli & Soft Cashmere.</p>
                    </button>
                </div>
            </div>

            <!-- STEP 2: OCCASION -->
            <div id="step-2" class="quiz-step hidden bg-white p-8 sm:p-12 rounded-3xl border border-[#C5A059]/30 shadow-md">
                <h2 class="font-serif text-2xl sm:text-3xl font-light text-[#121212] text-center mb-2">2. What is the primary setting where you will wear this?</h2>
                <p class="text-xs text-gray-500 text-center mb-8 uppercase tracking-wider">Select your key occasion</p>
                
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <button type="button" onclick="selectOccasion('office')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Office & Executive</span>
                            <span class="text-xl">💼</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">Sophisticated, non-offensive, clean professional aura.</p>
                    </button>

                    <button type="button" onclick="selectOccasion('date_night')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Date Night & Romance</span>
                            <span class="text-xl">🌙</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">Intimate, seductive, captivating scent bubble.</p>
                    </button>

                    <button type="button" onclick="selectOccasion('casual')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Everyday Signature</span>
                            <span class="text-xl">☀️</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">Easy-going, versatile, reliable daily wear.</p>
                    </button>

                    <button type="button" onclick="selectOccasion('wedding')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="flex items-center justify-between mb-2">
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059]">Weddings & Special Events</span>
                            <span class="text-xl">🍾</span>
                        </div>
                        <p class="text-xs text-gray-500 font-light">High-impact, head-turning luxury statement.</p>
                    </button>
                </div>

                <div class="mt-6 flex justify-start">
                    <button type="button" onclick="goToStep(1)" class="text-xs uppercase tracking-widest font-bold text-gray-500 hover:text-[#121212]">← Back</button>
                </div>
            </div>

            <!-- STEP 3: NOTES PREFERENCE -->
            <div id="step-3" class="quiz-step hidden bg-white p-8 sm:p-12 rounded-3xl border border-[#C5A059]/30 shadow-md">
                <h2 class="font-serif text-2xl sm:text-3xl font-light text-[#121212] text-center mb-2">3. Which scent notes appeal to you most?</h2>
                <p class="text-xs text-gray-500 text-center mb-8 uppercase tracking-wider">Select your primary note family</p>
                
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                    <button type="button" onclick="selectPreference('woods')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059] mb-1">Rich Woods & Leather</div>
                        <p class="text-xs text-gray-500 font-light">Cedarwood, Oud, Smokey Birch & Leather Accord.</p>
                    </button>

                    <button type="button" onclick="selectPreference('citrus')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059] mb-1">Fresh Citrus & Dew</div>
                        <p class="text-xs text-gray-500 font-light">Calabrian Bergamot, Crisp Grapefruit & Vetiver.</p>
                    </button>

                    <button type="button" onclick="selectPreference('vanilla')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059] mb-1">Warm Vanilla & Spices</div>
                        <p class="text-xs text-gray-500 font-light">Madagascar Vanilla, Cinnamon, Cardamom & Amber.</p>
                    </button>

                    <button type="button" onclick="selectPreference('florals')" class="p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group">
                        <div class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059] mb-1">Soft Florals & White Musk</div>
                        <p class="text-xs text-gray-500 font-light">Jasmine Sambac, White Iris & Soft Cashmere.</p>
                    </button>
                </div>

                <div class="mt-6 flex justify-start">
                    <button type="button" onclick="goToStep(2)" class="text-xs uppercase tracking-widest font-bold text-gray-500 hover:text-[#121212]">← Back</button>
                </div>
            </div>

            <!-- STEP 4: PERFORMANCE FOCUS -->
            <div id="step-4" class="quiz-step hidden bg-white p-8 sm:p-12 rounded-3xl border border-[#C5A059]/30 shadow-md">
                <h2 class="font-serif text-2xl sm:text-3xl font-light text-[#121212] text-center mb-2">4. What performance level do you expect?</h2>
                <p class="text-xs text-gray-500 text-center mb-8 uppercase tracking-wider">Select your longevity and sillage requirement</p>
                
                <div class="space-y-4">
                    <button type="button" onclick="selectPerformance('eternal')" class="w-full p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group flex items-center justify-between">
                        <div>
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059] block">Lasts All Day (Eternal 10+ Hours)</span>
                            <span class="text-xs text-gray-500 font-light">High fabric and skin retention engineered for tropical West African weather.</span>
                        </div>
                        <span class="text-xs uppercase tracking-widest font-bold text-[#C5A059] bg-[#C5A059]/10 px-3 py-1.5 rounded-full">Top Choice</span>
                    </button>

                    <button type="button" onclick="selectPerformance('strong')" class="w-full p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group flex items-center justify-between">
                        <div>
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059] block">Fills The Room (Strong Projection)</span>
                            <span class="text-xs text-gray-500 font-light">Noticeable scent bubble radius that makes an immediate entrance.</span>
                        </div>
                        <span class="text-xs uppercase tracking-widest font-bold text-gray-500 bg-gray-100 px-3 py-1.5 rounded-full">Popular</span>
                    </button>

                    <button type="button" onclick="selectPerformance('intimate')" class="w-full p-6 rounded-2xl border border-gray-200 text-left hover:border-[#C5A059] hover:bg-[#FAF8F5] transition-all group flex items-center justify-between">
                        <div>
                            <span class="font-serif text-xl font-bold text-[#121212] group-hover:text-[#C5A059] block">Subtle & Intimate Sillage</span>
                            <span class="text-xs text-gray-500 font-light">Stays close to skin for personal enjoyment and subtle encounters.</span>
                        </div>
                        <span class="text-xs uppercase tracking-widest font-bold text-gray-500 bg-gray-100 px-3 py-1.5 rounded-full">Discreet</span>
                    </button>
                </div>

                <div class="mt-6 flex justify-start">
                    <button type="button" onclick="goToStep(3)" class="text-xs uppercase tracking-widest font-bold text-gray-500 hover:text-[#121212]">← Back</button>
                </div>
            </div>

            <!-- STEP 5: RESULTS VIEW -->
            <div id="step-5" class="quiz-step hidden space-y-8">
                
                <!-- LOADING SPINNER -->
                <div id="loading-spinner" class="bg-white p-16 rounded-3xl border border-[#C5A059]/30 shadow-md text-center space-y-4">
                    <div class="w-16 h-16 border-4 border-[#C5A059] border-t-transparent rounded-full animate-spin mx-auto"></div>
                    <h3 class="font-serif text-2xl font-light text-[#121212]">Analyzing Olfactory Profile...</h3>
                    <p class="text-xs text-gray-500 uppercase tracking-widest">Evaluating notes, longevity ratings, and mood alignment</p>
                </div>

                <!-- RESULTS CONTENT -->
                <div id="results-content" class="hidden">
                    <div class="text-center mb-8">
                        <span class="text-xs uppercase tracking-[0.35em] text-[#C5A059] font-bold block mb-1">Your Olfactory Matches</span>
                        <h2 class="font-serif text-3xl sm:text-4xl font-light text-[#121212]">Curated Top 3 Fragrances</h2>
                        <p class="text-xs text-gray-500 mt-2">Based on your mood, occasion, notes preference, and climate longevity requirements.</p>
                    </div>

                    <div id="recommendations-grid" class="grid grid-cols-1 md:grid-cols-3 gap-6"></div>

                    <!-- RE-TAKE QUIZ BUTTON -->
                    <div class="text-center mt-10">
                        <button type="button" onclick="resetQuiz()" class="inline-block px-8 py-3.5 border border-[#C5A059] text-[#121212] uppercase tracking-widest text-xs font-bold rounded-xl hover:bg-[#F5F1E8] transition-all">
                            🔄 Re-take Scent Finder Quiz
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- VANILLA JS QUIZ ENGINE -->
    <script>
        const quizAnswers = {
            mood: 'bold',
            occasion: 'date_night',
            preference: 'vanilla',
            performance: 'eternal'
        };

        const stepTopics = {
            1: 'Mood & Aura',
            2: 'Occasion',
            3: 'Notes Preference',
            4: 'Performance'
        };

        function goToStep(stepNumber) {
            document.querySelectorAll('.quiz-step').forEach(el => el.classList.add('hidden'));
            const currentStepEl = document.getElementById('step-' + stepNumber);
            if (currentStepEl) {
                currentStepEl.classList.remove('hidden');
            }

            const progressContainer = document.getElementById('quiz-progress-container');
            if (stepNumber <= 4) {
                if (progressContainer) progressContainer.classList.remove('hidden');
                document.getElementById('quiz-step-label').textContent = 'Step ' + stepNumber + ' of 4';
                document.getElementById('quiz-topic-label').textContent = stepTopics[stepNumber] || '';
                document.getElementById('quiz-progress-bar').style.width = (stepNumber * 25) + '%';
            } else {
                if (progressContainer) progressContainer.classList.add('hidden');
            }
        }

        function selectMood(mood) {
            quizAnswers.mood = mood;
            goToStep(2);
        }

        function selectOccasion(occasion) {
            quizAnswers.occasion = occasion;
            goToStep(3);
        }

        function selectPreference(preference) {
            quizAnswers.preference = preference;
            goToStep(4);
        }

        function selectPerformance(performance) {
            quizAnswers.performance = performance;
            submitQuiz();
        }

        async function submitQuiz() {
            goToStep(5);
            document.getElementById('loading-spinner').classList.remove('hidden');
            document.getElementById('results-content').classList.add('hidden');

            try {
                const response = await fetch('{{ route("shop.scent_finder.recommend") }}', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(quizAnswers)
                });

                const data = await response.json();
                if (data.success && data.recommendations) {
                    renderRecommendations(data.recommendations);
                }
            } catch (err) {
                console.error('Error evaluating quiz:', err);
            } finally {
                document.getElementById('loading-spinner').classList.add('hidden');
                document.getElementById('results-content').classList.remove('hidden');
            }
        }

        function renderRecommendations(items) {
            const grid = document.getElementById('recommendations-grid');
            if (!grid) return;

            grid.innerHTML = items.map((item, idx) => `
                <div class="bg-white rounded-3xl border border-[#C5A059]/30 shadow-sm hover:shadow-xl transition-all duration-300 overflow-hidden flex flex-col justify-between p-6 relative">
                    <div class="flex items-center justify-between mb-4">
                        <span class="text-[10px] uppercase tracking-widest font-bold bg-[#121212] text-[#FFFFF0] px-3 py-1 rounded-full">Rank #${idx + 1}</span>
                        <span class="text-xs font-bold text-emerald-700 bg-emerald-50 px-3 py-1 rounded-full border border-emerald-200">${item.match_score}% Match</span>
                    </div>

                    <div class="h-48 rounded-2xl overflow-hidden bg-gray-50 mb-4 border border-gray-100 relative group">
                        <img src="${item.image_url}" alt="${item.name}" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500">
                    </div>

                    <div class="space-y-3 flex-grow">
                        <h3 class="font-serif text-xl font-bold text-[#121212] leading-snug">${item.name}</h3>
                        <p class="text-xs font-semibold text-[#C5A059]">${item.price_html}</p>
                        
                        <div class="p-3 bg-[#FAF8F5] rounded-xl border border-[#C5A059]/20 text-[11px] text-gray-600 leading-relaxed font-light">
                            <span class="font-bold text-[#121212] block mb-0.5">Why it fits you:</span>
                            <span>${item.explanation}</span>
                        </div>

                        <p class="text-[10px] text-gray-500 italic">${item.short_notes}</p>
                    </div>

                    <div class="mt-6 pt-4 border-t border-gray-100 flex flex-col gap-2">
                        <a href="${item.url_key}" class="w-full py-2.5 bg-[#121212] text-[#FFFFF0] text-center text-xs uppercase tracking-widest font-bold rounded-xl hover:bg-[#C5A059] hover:text-[#121212] transition-colors">
                            View Fragrance Notes
                        </a>
                    </div>
                </div>
            `).join('');
        }

        function resetQuiz() {
            goToStep(1);
        }
    </script>
</x-shop::layouts>
