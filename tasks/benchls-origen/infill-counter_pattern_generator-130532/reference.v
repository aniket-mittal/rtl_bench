module origen_130532 (
    input wire clk,
    input wire rst_n,
    output wire out_1bit,
    output wire [2:0] out_3bit,
    output wire [7:0] out_8bit
);

reg [2:0] counter;
reg data_in, enable;
reg [2:0] data_3bit;
reg [7:0] data_8bit;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        counter <= 3'b000;
        data_in <= 1'b0;
        enable <= 1'b0;
        data_3bit <= 3'h0;
        data_8bit <= 8'h00;
    end else begin
        counter <= counter + 1'b1;
        case (counter)
            3'd0: begin
                data_in <= 1'b1;
                data_3bit <= 3'h1;
                data_8bit <= 8'h11;
                enable <= 1'b1;
            end
            3'd1: begin
                data_in <= 1'b0;
                data_3bit <= 3'h2;
                data_8bit <= 8'h33;
                enable <= 1'b0;
            end
            3'd2: begin
                data_in <= 1'b1;
                data_3bit <= 3'h3;
                data_8bit <= 8'h44;
                enable <= 1'b1;
            end
            3'd3: begin
                data_in <= 1'b1;
                data_3bit <= 3'h4;
                data_8bit <= 8'h77;
                enable <= 1'b1;
            end
            3'd4: begin
                data_in <= 1'b1;
                data_3bit <= 3'h0;
                data_8bit <= 8'h88;
                enable <= 1'b1;
            end
            default: begin
                data_in <= 1'b0;
                data_3bit <= 3'h0;
                data_8bit <= 8'h00;
                enable <= 1'b0;
            end
        endcase
    end
end

reg ff_1bit, ff_3bit, ff_8bit;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ff_1bit <= 1'b0;
        ff_3bit <= 3'h0;
        ff_8bit <= 8'h00;
    end else if (enable) begin
        ff_1bit <= data_in;
        ff_3bit <= data_3bit;
        ff_8bit <= data_8bit;
    end
end

assign out_1bit = ff_1bit;
assign out_3bit = ff_3bit;
assign out_8bit = ff_8bit;

endmodule

