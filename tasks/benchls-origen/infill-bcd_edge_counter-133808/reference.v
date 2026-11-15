module origen_133808 (
    input wire clk,
    input wire rst_n,
    input wire [7:0] binary_input,
    output wire [15:0] bcd_output
);

wire [7:0] edge_detected;
wire [15:0] bcd_counter;
reg [2:0] enable;

// Edge detection module
edge_detector edge_det (
    .clk(clk),
    .rst_n(rst_n),
    .input_vector(binary_input),
    .edge_detected(edge_detected)
);

// BCD counter module
bcd_counter counter (
    .clk(clk),
    .rst_n(rst_n),
    .bcd_out(bcd_counter)
);

// Binary to BCD conversion module
binary_to_bcd converter (
    .clk(clk),
    .rst_n(rst_n),
    .binary_in(edge_detected),
    .bcd_in(bcd_counter),
    .enable(enable),
    .bcd_out(bcd_output)
);

// Priority encoder for enable signals
always @(*) begin
    casez (edge_detected)
        8'b1???????: enable = 3'b111;
        8'b01??????: enable = 3'b110;
        8'b001?????: enable = 3'b101;
        8'b0001????: enable = 3'b100;
        default:     enable = 3'b000;
    endcase
end

endmodule

module edge_detector (
    input wire clk,
    input wire rst_n,
    input wire [7:0] input_vector,
    output reg [7:0] edge_detected
);

reg [7:0] input_prev;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        input_prev <= 8'b0;
        edge_detected <= 8'b0;
    end else begin
        input_prev <= input_vector;
        edge_detected <= input_vector ^ input_prev;
    end
end

endmodule

module bcd_counter (
    input wire clk,
    input wire rst_n,
    output reg [15:0] bcd_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bcd_out <= 16'b0;
    end else begin
        if (bcd_out[3:0] == 4'd9) begin
            bcd_out[3:0] <= 4'd0;
            if (bcd_out[7:4] == 4'd9) begin
                bcd_out[7:4] <= 4'd0;
                if (bcd_out[11:8] == 4'd9) begin
                    bcd_out[11:8] <= 4'd0;
                    if (bcd_out[15:12] == 4'd9) begin
                        bcd_out[15:12] <= 4'd0;
                    end else begin
                        bcd_out[15:12] <= bcd_out[15:12] + 1'b1;
                    end
                end else begin
                    bcd_out[11:8] <= bcd_out[11:8] + 1'b1;
                end
            end else begin
                bcd_out[7:4] <= bcd_out[7:4] + 1'b1;
            end
        end else begin
            bcd_out[3:0] <= bcd_out[3:0] + 1'b1;
        end
    end
end

endmodule

module binary_to_bcd (
    input wire clk,
    input wire rst_n,
    input wire [7:0] binary_in,
    input wire [15:0] bcd_in,
    input wire [2:0] enable,
    output reg [15:0] bcd_out
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        bcd_out <= 16'b0;
    end else begin
        bcd_out[3:0] <= binary_in[3:0];
        if (enable[0]) bcd_out[7:4] <= binary_in[7:4];
        if (enable[1]) bcd_out[11:8] <= bcd_in[7:4];
        if (enable[2]) bcd_out[15:12] <= bcd_in[11:8];
    end
end

endmodule