SELECT
    phone,
    -- Step 1: Remove special characters
    regexp_replace(
        -- Step 2: Handle leading 1 or 001
        CASE
            WHEN regexp_matches(regexp_replace(phone, '[^0-9]', '', 'g'), '^(1|001)')
            THEN regexp_replace(regexp_replace(phone, '[^0-9]', '', 'g'), '^(1|001)', '')
            -- Step 3: Preserve numbers before letters, remove after
            ELSE regexp_replace(
                regexp_replace(phone, '([0-9]+)[a-zA-Z].*', '\1'),
                '[^0-9]', '', 'g'
            )
        END,
        -- Final cleanup in case any special chars remain
        '[^0-9]', '', 'g'
    ) AS cleaned_column
FROM stg__patients;