/**
 * Emanaura - Custom JavaScript
 */

document.addEventListener('DOMContentLoaded', function() {
    // Add animation class to elements as they appear in the viewport
    const animateElements = document.querySelectorAll('.product-card, .category-sidebar, .main-container');

    if ('IntersectionObserver' in window) {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animated');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        animateElements.forEach(el => {
            el.classList.remove('animated');
            observer.observe(el);
        });
    }

    // Enhance product image zoom on hover
    const productImages = document.querySelectorAll('.product-image');
    productImages.forEach(img => {
        img.addEventListener('mouseover', function() {
            this.style.transform = 'scale(1.05)';
            this.style.transition = 'transform 0.3s ease';
        });

        img.addEventListener('mouseout', function() {
            this.style.transform = 'scale(1)';
        });
    });

    // Add to cart animation
    const addToCartButtons = document.querySelectorAll('.btn-add-to-cart');
    addToCartButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            const productCard = this.closest('.product-card');
            if (productCard) {
                productCard.classList.add('pulse');
                setTimeout(() => {
                    productCard.classList.remove('pulse');
                }, 1000);
            }
        });
    });

    // Category sidebar filter toggle for mobile
    const categoryToggleBtn = document.getElementById('category-toggle');
    const categoryList = document.querySelector('.category-sidebar .list-group');

    if (categoryToggleBtn && categoryList) {
        categoryToggleBtn.addEventListener('click', function() {
            categoryList.classList.toggle('show-mobile');
            this.querySelector('i').classList.toggle('fa-chevron-down');
            this.querySelector('i').classList.toggle('fa-chevron-up');
        });
    }

    // "Back to top" button
    const backToTopBtn = document.querySelector('.back-to-top');
    if (backToTopBtn) {
        window.addEventListener('scroll', function() {
            if (window.pageYOffset > 300) {
                backToTopBtn.classList.add('show');
            } else {
                backToTopBtn.classList.remove('show');
            }
        });

        backToTopBtn.addEventListener('click', function(e) {
            e.preventDefault();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    }
});
/**
 * Simple script to handle subcategory toggling
 */
document.addEventListener('DOMContentLoaded', function() {
    // Find all subcategory toggle icons
    const subcategoryToggles = document.querySelectorAll('.subcategory-toggle');

    // Add click event to each toggle
    subcategoryToggles.forEach(toggle => {
        toggle.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();

            // Find the parent category-item
            const categoryItem = this.closest('.category-item');

            // Find the subcategory list within this category item
            const subcategoryList = categoryItem.querySelector('.subcategory-list');

            // Toggle the 'show' class
            if (subcategoryList) {
                subcategoryList.classList.toggle('show');
                this.classList.toggle('fa-chevron-down');
                this.classList.toggle('fa-chevron-up');
            }
        });
    });

    // Auto-expand subcategories if one is active
    const activeSubcategory = document.querySelector('.subcategory-item.active');
    if (activeSubcategory) {
        const parentList = activeSubcategory.closest('.subcategory-list');
        if (parentList) {
            parentList.classList.add('show');
            const toggle = parentList.parentElement.querySelector('.subcategory-toggle');
            if (toggle) {
                toggle.classList.remove('fa-chevron-down');
                toggle.classList.add('fa-chevron-up');
            }
        }
    }
});