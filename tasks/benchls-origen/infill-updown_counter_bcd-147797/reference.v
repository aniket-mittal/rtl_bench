module origen_147797(
    input wire clk,
    input wire reset,
    input wire [3:0] binary_input,
    input wire load,
    input wire up_down,
    output wire [7:0] final_output
);

    wire [7:0] bcd_value;
    wire [7:0] counter_output;

    // Binary to BCD converter
    binary_to_bcd b2b (
        .binary_input(binary_input),
        .bcd_output(bcd_value)
    );

    // Up/Down counter with synchronous load and asynchronous reset
    up_down_counter counter (
        .clk(clk),
        .reset(reset),
        .load(load),
        .up_down(up_down),
        .load_value(bcd_value),
        .count(counter_output)
    );

    // Additional functional module to compute final output
    adder final_adder (
        .a(counter_output),
        .b(bcd_value),
        .sum(final_output)
    );

endmodule

module binary_to_bcd(
    input wire [3:0] binary_input,
    output reg [7:0] bcd_output
);

    always @(*) begin
        case(binary_input)
            4'b0000: bcd_output = 8'h00;
            4'b0001: bcd_output = 8'h01;
            4'b0010: bcd_output = 8'h02;
            4'b0011: bcd_output = 8'h03;
            4'b0100: bcd_output = 8'h04;
            4'b0101: bcd_output = 8'h05;
            4'b0110: bcd_output = 8'h06;
            4'b0111: bcd_output = 8'h07;
            4'b1000: bcd_output = 8'h08;
            4'b1001: bcd_output = 8'h09;
            4'b1010: bcd_output = 8'h10;
            4'b1011: bcd_output = 8'h11;
            4'b1100: bcd_output = 8'h12;
            4'b1101: bcd_output = 8'h13;
            4'b1110: bcd_output = 8'h14;
            4'b1111: bcd_output = 8'h15;
        endcase
    end

endmodule

module up_down_counter(
    input wire clk,
    input wire reset,
    input wire load,
    input wire up_down,
    input wire [7:0] load_value,
    output reg [7:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 8'h00;
        end else if (load) begin
            count <= load_value;
        end else if (up_down) begin
            if (count == 8'h99)
                count <= 8'h00;
            else if (count[3:0] == 4'h9)
                count <= {count[7:4] + 1'b1, 4'h0};
            else
                count <= count + 1'b1;
        end else begin
            if (count == 8'h00)
                count <= 8'h99;
            else if (count[3:0] == 4'h0)
                count <= {count[7:4] - 1'b1, 4'h9};
            else
                count <= count - 1'b1;
        end
    end

endmodule

module adder(
    input wire [7:0] a,
    input wire [7:0] b,
    output reg [7:0] sum
);

    always @(*) begin
        sum[3:0] = a[3:0] + b[3:0];
        sum[7:4] = a[7:4] + b[7:4] + (sum[3:0] > 4'h9 ? 1'b1 : 1'b0);
        
        if (sum[3:0] > 4'h9)
            sum[3:0] = sum[3:0] - 4'ha;
        
        if (sum[7:4] > 4'h9)
            sum[7:4] = sum[7:4] - 4'ha;
    end

endmodule