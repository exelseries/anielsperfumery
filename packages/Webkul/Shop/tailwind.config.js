/** @type {import('tailwindcss').Config} */
module.exports = {
    content: ["./src/Resources/**/*.blade.php", "./src/Resources/**/*.js"],

    theme: {
        container: {
            center: true,

            screens: {
                "2xl": "1440px",
            },

            padding: {
                DEFAULT: "90px",
            },
        },

        screens: {
            sm: "525px",
            md: "768px",
            lg: "1024px",
            xl: "1240px",
            "2xl": "1440px",
            1180: "1180px",
            1060: "1060px",
            991: "991px",
            868: "868px",
        },

        extend: {
            colors: {
                ivory: '#FFFFF0',
                softBeige: '#F5F5DC',
                matteBlack: '#121212',
                champagneGold: '#C5A059',
                softChampagne: '#F7E7CE',
                charcoal: '#1E1E1E',
                navyBlue: "#121212", // Keep for backwards compatibility if needed
                lightOrange: "#F7E7CE",
                darkGreen: '#40994A',
                darkBlue: '#0044F2',
                darkPink: '#F85156',
            },

            fontFamily: {
                poppins: ["Inter", "sans-serif"],
                dmserif: ["Playfair Display", "serif"],
            },
        }
    },

    plugins: [],

    safelist: [
        {
            pattern: /icon-/,
        }
    ]
};
