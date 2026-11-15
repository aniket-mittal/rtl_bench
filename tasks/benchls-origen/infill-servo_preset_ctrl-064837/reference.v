module origen_064837 (
    input wire clk,
    input wire rst,
    output wire [3:0] signal
);

    reg [2:0] init;
    reg cs;
    reg [1:0] addr;
    reg [15:0] data;

    wire [15:0] preset_positions [0:3];
    assign preset_positions[0] = 16'd500;
    assign preset_positions[1] = 16'd1000;
    assign preset_positions[2] = 16'd1500;
    assign preset_positions[3] = 16'd2000;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            init <= 3'b000;
            cs <= 1'b1;
            addr <= 2'b00;
            data <= 16'd0;
        end else begin
            if (init < 3'b100) begin
                cs <= 1'b1;
                addr <= init[1:0];
                data <= preset_positions[init[1:0]];
                init <= init + 1'b1;
            end else begin
                cs <= 1'b0;
            end
        end
    end

    ServoController servo_controller (
        .clk(clk),
        .rst(rst),
        .cs(cs),
        .addr(addr),
        .data(data),
        .signal(signal)
    );

endmodule

module ServoController (
    input wire clk,
    input wire rst,
    input wire cs,
    input wire [1:0] addr,
    input wire [15:0] data,
    output wire [3:0] signal
);

    wire [3:0] load;
    assign load = cs ? (4'b0001 << addr) : 4'b0000;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : servo_instances
            ServoModule servo_module (
                .clk(clk),
                .rst(rst),
                .load(load[i]),
                .data(data),
                .signal(signal[i])
            );
        end
    endgenerate

endmodule

module ServoModule (
    input wire clk,
    input wire rst,
    input wire load,
    input wire [15:0] data,
    output reg signal
);

    reg [20:0] counter;
    reg [15:0] compare_value;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 21'd0;
            compare_value <= 16'd0;
            signal <= 1'b0;
        end else begin
            if (load) begin
                compare_value <= data;
            end

            if (counter == 21'd2000000) begin
                counter <= 21'd0;
            end else begin
                counter <= counter + 1'b1;
            end

            signal <= (counter < {compare_value, 7'b0000000}) ? 1'b1 : 1'b0;
        end
    end

endmodule