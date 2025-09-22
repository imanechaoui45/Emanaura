/**
 * Emanaura - Home Page JavaScript
 */

document.addEventListener('DOMContentLoaded', function() {
    // Initialize the hero slider with animation classes
    const heroSlider = document.getElementById('carouselExampleIndicators');

    if (heroSlider) {
        // Add animation to the first slide's caption elements
        const firstSlideCaption = heroSlider.querySelector('.carousel-item.active .carousel-caption');
        if (firstSlideCaption) {
            firstSlideCaption.querySelector('h1').classList.add('animate__animated', 'animate__fadeInDown');
            firstSlideCaption.querySelector('p').classList.add('animate__animated', 'animate__fadeInUp');
            firstSlideCaption.querySelector('.btn').classList.add('animate__animated', 'animate__fadeInUp');
        }

        // Add event listener for slide change
        heroSlider.addEventListener('slide.bs.carousel', function(e) {
            // Remove animation classes from all slides
            const captions = heroSlider.querySelectorAll('.carousel-caption');
            captions.forEach(caption => {
                const h1 = caption.querySelector('h1');
                const p = caption.querySelector('p');
                const btn = caption.querySelector('.btn');

                if (h1) h1.classList.remove('animate__animated', 'animate__fadeInDown');
                if (p) p.classList.remove('animate__animated', 'animate__fadeInUp');
                if (btn) btn.classList.remove('animate__animated', 'animate__fadeInUp');
            });

            // Add animation classes to the next slide after a small delay
            setTimeout(() => {
                const nextSlideCaption = e.relatedTarget.querySelector('.carousel-caption');
                if (nextSlideCaption) {
                    const h1 = nextSlideCaption.querySelector('h1');
                    const p = nextSlideCaption.querySelector('p');
                    const btn = nextSlideCaption.querySelector('.btn');

                    if (h1) h1.classList.add('animate__animated', 'animate__fadeInDown');
                    if (p) p.classList.add('animate__animated', 'animate__fadeInUp');
                    if (btn) btn.classList.add('animate__animated', 'animate__fadeInUp');
                }
            }, 50);
        });
    }

    // Animate elements when they come into view
    const animateOnScroll = function() {
        const elements = document.querySelectorAll('.feature-box, .category-item, .product-card, .testimonial-card');

        elements.forEach(element => {
            const elementTop = element.getBoundingClientRect().top;
            const elementBottom = element.getBoundingClientRect().bottom;

            // Check if element is in viewport
            if (elementTop < window.innerHeight && elementBottom > 0) {
                element.classList.add('animate__animated', 'animate__fadeInUp');
                element.style.opacity = '1';
            }
        });
    };

    // Set initial opacity to 0 for elements to be animated
    const elementsToAnimate = document.querySelectorAll('.feature-box, .category-item, .product-card, .testimonial-card');
    elementsToAnimate.forEach(element => {
        element.style.opacity = '0';
    });

    // Run animation on scroll
    window.addEventListener('scroll', animateOnScroll);

    // Run animation on initial load
    animateOnScroll();

    // Newsletter form validation
    const newsletterForm = document.querySelector('.newsletter-form');
    if (newsletterForm) {
        newsletterForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const emailInput = this.querySelector('input[type="email"]');
            if (emailInput && emailInput.value) {
                // Would normally submit to server, but for now just show alert
                alert('Thank you for subscribing to our newsletter!');
                emailInput.value = '';
            } else {
                alert('Please enter a valid email address.');
            }
        });
    }
});