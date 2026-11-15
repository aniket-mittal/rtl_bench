module origen_140106 #(
    parameter k = 256,
    parameter m = 512,
    parameter h = 256,
    parameter block_size = 512
) (
    input wire [k-1:0] key,
    input wire [m-1:0] msg,
    input wire [h-1:0] hash,
    output reg [h-1:0] out,
    output reg valid
);

    reg [block_size-1:0] key_padded;
    reg [block_size-1:0] inner_key;
    reg [block_size-1:0] outer_key;
    reg [block_size+m-1:0] inner_data;
    reg [block_size+h-1:0] outer_data;
    reg [h-1:0] inner_hash;
    reg [h-1:0] computed_hash;

    // Hash function (placeholder, replace with actual hash function)
    function [h-1:0] hash_function;
        input [block_size+m-1:0] data;
        begin
            // Implement actual hash function here
            hash_function = data[h-1:0]; // Placeholder
        end
    endfunction

    always @(*) begin
        // Step 1 & 2: Key padding
        if (k > block_size) begin
            key_padded = hash_function(key);
        end else begin
            key_padded = {{(block_size-k){1'b0}}, key};
        end

        // Step 3: XOR key with inner padding
        inner_key = key_padded ^ {block_size/8{8'h36}};

        // Step 4 & 5: Concatenate and hash inner data
        inner_data = {inner_key, msg};
        inner_hash = hash_function(inner_data);

        // Step 6: XOR key with outer padding
        outer_key = key_padded ^ {block_size/8{8'h5C}};

        // Step 7 & 8: Concatenate and hash outer data
        outer_data = {outer_key, inner_hash};
        computed_hash = hash_function(outer_data);

        // Set output hash
        out = computed_hash;

        // Verify hash
        valid = (computed_hash == hash);
    end

endmodule