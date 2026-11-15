module origen_131588 #(
    parameter n = 512,  // message length
    parameter k = 256,  // key length
    parameter m = 256,  // hash length
    parameter b = 512   // block size
) (
    input wire [n-1:0] message,
    input wire [k-1:0] key,
    input wire [m-1:0] hash_in,
    output wire [m-1:0] hash_out,
    output wire valid
);

    // Constants
    localparam IPAD = 8'h36;
    localparam OPAD = 8'h5c;

    // Internal signals
    reg [b-1:0] key_block;
    reg [b-1:0] i_key_pad;
    reg [b-1:0] o_key_pad;
    wire [m-1:0] inner_hash;
    wire [m-1:0] outer_hash;

    // Pad the key if necessary
    always @(*) begin
        if (k > b) begin
            key_block = sha256(key);
        end else begin
            key_block = {{(b-k){1'b0}}, key};
        end
    end

    // Create inner and outer key pads
    always @(*) begin
        i_key_pad = key_block ^ {(b/8){IPAD}};
        o_key_pad = key_block ^ {(b/8){OPAD}};
    end

    // Compute inner hash
    assign inner_hash = sha256({i_key_pad, message});

    // Compute outer hash (HMAC result)
    assign outer_hash = sha256({o_key_pad, inner_hash});

    // Assign output hash
    assign hash_out = outer_hash;

    // Check if computed hash matches input hash
    assign valid = (hash_out == hash_in);

    // SHA-256 function (simplified for brevity)
    function [255:0] sha256;
        input [b-1:0] data;
        // SHA-256 implementation goes here
        // This is a placeholder and should be replaced with actual SHA-256 logic
        sha256 = data[255:0] ^ data[b-1:b-256];
    endfunction

endmodule