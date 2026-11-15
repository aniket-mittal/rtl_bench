module origen_058059 (
    input wire [7:0] data_mux,
    input wire valid_mux,
    input wire reset_L,
    input wire clk_2f,
    output reg [7:0] data_stripe_0,
    output reg [7:0] data_stripe_1,
    output reg valid_stripe_0,
    output reg valid_stripe_1
);

    reg selector;
    reg validflop;
    reg [7:0] l0, l1;
    reg flag;

    always @(posedge clk_2f or negedge reset_L) begin
        if (!reset_L) begin
            selector <= 1'b0;
            validflop <= 1'b0;
            l0 <= 8'b0;
            l1 <= 8'b0;
            data_stripe_0 <= 8'b0;
            data_stripe_1 <= 8'b0;
            valid_stripe_0 <= 1'b0;
            valid_stripe_1 <= 1'b0;
            flag <= 1'b0;
        end else begin
            selector <= ~selector;
            validflop <= valid_mux;
            
            if (selector == 1'b0) begin
                data_stripe_0 <= data_mux;
                data_stripe_1 <= l1;
                l0 <= data_mux;
            end else begin
                data_stripe_1 <= data_mux;
                data_stripe_0 <= l0;
                l1 <= data_mux;
            end
            
            if (valid_mux) begin
                valid_stripe_0 <= selector ? validflop : 1'b1;
                valid_stripe_1 <= selector ? 1'b1 : validflop;
                flag <= 1'b0;
            end else begin
                valid_stripe_0 <= selector ? validflop : 1'b0;
                valid_stripe_1 <= selector ? 1'b0 : validflop;
            end
        end
    end

endmodule