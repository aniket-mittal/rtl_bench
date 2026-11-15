module origen_144480 (
    input wire clk,
    input wire rst,
    input wire [1:0] algorithm_select,
    input wire [127:0] key,
    input wire [63:0] data_in,
    output wire [63:0] encrypted_out
);

    wire [31:0] des_out;
    wire [63:0] aes_out;

    // DES encryption module
    des_encryption des (
        .clk(clk),
        .rst(rst),
        .key(key[55:0]),
        .data_in(data_in[31:0]),
        .encrypted_out(des_out)
    );

    // AES encryption module
    aes_encryption aes (
        .clk(clk),
        .rst(rst),
        .key(key),
        .data_in(data_in),
        .encrypted_out(aes_out)
    );

    // Output selection module
    output_selector selector (
        .clk(clk),
        .rst(rst),
        .algorithm_select(algorithm_select),
        .des_in(des_out),
        .aes_in(aes_out),
        .encrypted_out(encrypted_out)
    );

endmodule

module des_encryption (
    input wire clk,
    input wire rst,
    input wire [55:0] key,
    input wire [31:0] data_in,
    output reg [31:0] encrypted_out
);

    // DES encryption logic goes here
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            encrypted_out <= 32'b0;
        end else begin
            // Perform DES encryption
            // This is a placeholder for the actual DES algorithm
            encrypted_out <= data_in ^ key[31:0];
        end
    end

endmodule

module aes_encryption (
    input wire clk,
    input wire rst,
    input wire [127:0] key,
    input wire [63:0] data_in,
    output reg [63:0] encrypted_out
);

    // AES encryption logic goes here
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            encrypted_out <= 64'b0;
        end else begin
            // Perform AES encryption
            // This is a placeholder for the actual AES algorithm
            encrypted_out <= data_in ^ key[63:0];
        end
    end

endmodule

module output_selector (
    input wire clk,
    input wire rst,
    input wire [1:0] algorithm_select,
    input wire [31:0] des_in,
    input wire [63:0] aes_in,
    output reg [63:0] encrypted_out
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            encrypted_out <= 64'b0;
        end else begin
            case (algorithm_select)
                2'b00: encrypted_out <= {32'b0, des_in};
                2'b01: encrypted_out <= aes_in;
                default: encrypted_out <= 64'b0;
            endcase
        end
    end

endmodule