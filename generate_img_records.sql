DO $$ 
DECLARE
    product_record RECORD;  -- Declare a variable to hold each row in the loop
BEGIN
    -- Loop through each product in the products table
    FOR product_record IN
        SELECT id FROM products
    LOOP
        -- Insert the first image record for each product
        INSERT INTO product_image (product_id, image)
        VALUES (product_record.id, '/product_images/circle1.jpg');

        -- Insert the second image record for each product
        INSERT INTO product_image (product_id, image)
        VALUES (product_record.id, '/product_images/circle2.jpg');
    END LOOP;
END $$;