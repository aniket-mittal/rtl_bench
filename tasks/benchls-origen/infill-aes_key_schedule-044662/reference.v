module origen_044662 (
    input wire clk,
    input wire rst_n,
    input wire [255:0] key,
    input wire [127:0] l1,
    input wire [1:0] key_op,
    input wire key_en,
    input wire key_clr,
    output reg [1:0] st_ksize,
    output reg warn_ksize,
    output wire [127:0] w0,
    output wire [127:0] w1,
    output wire [127:0] w2,
    output wire [127:0] w3
);

    reg [511:0] tk;
    reg warn_128, warn_192;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tk <= 512'b0;
            st_ksize <= 2'b00;
            warn_ksize <= 1'b0;
            warn_128 <= 1'b0;
            warn_192 <= 1'b0;
        end else if (key_clr) begin
            tk <= 512'b0;
            st_ksize <= 2'b00;
            warn_ksize <= 1'b0;
            warn_128 <= 1'b0;
            warn_192 <= 1'b0;
        end else if (key_en) begin
            case (key_op)
                2'b00: tk <= {tk[383:0], l1};
                2'b01: tk <= {tk[511:256], key[255:128], tk[127:0]};
                2'b10: tk <= {tk[511:384], key[255:64], tk[63:0]};
                2'b11: tk <= {tk[511:256], key};
            endcase

            if (key_op != 2'b00) begin
                st_ksize <= key_op;
                warn_128 <= (key_op == 2'b01) && (key[127:0] == 128'b0);
                warn_192 <= (key_op == 2'b10) && (key[63:0] == 64'b0);
                warn_ksize <= (key_op == 2'b00);
            end
        end
    end

    assign w0 = tk[127:0];
    assign w1 = tk[255:128];
    assign w2 = tk[383:256];
    assign w3 = tk[511:384];

endmodule