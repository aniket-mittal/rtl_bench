module origen_139984 (
    input wire clk,
    input wire rst,
    input wire [2:0] read_addr,
    input wire [2:0] write_addr,
    input wire [3:0] write_data,
    input wire [31:0] input_signal,
    input wire select,
    output wire [3:0] output_data
);

    wire [3:0] ram_output;
    wire [31:0] detection_output;
    wire [3:0] functional_output;

    // Dual-port RAM module
    dual_port_ram ram (
        .clk(clk),
        .rst(rst),
        .read_addr(read_addr),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data(ram_output)
    );

    // Input signal detection module
    input_signal_detector detector (
        .clk(clk),
        .rst(rst),
        .input_signal(input_signal),
        .detection_output(detection_output)
    );

    // Functional module
    functional_module func_mod (
        .ram_data(ram_output),
        .detection_data(detection_output),
        .func_output(functional_output)
    );

    // Control logic module
    control_logic ctrl (
        .select(select),
        .ram_data(ram_output),
        .func_data(functional_output),
        .output_data(output_data)
    );

endmodule

module dual_port_ram (
    input wire clk,
    input wire rst,
    input wire [2:0] read_addr,
    input wire [2:0] write_addr,
    input wire [3:0] write_data,
    output reg [3:0] read_data
);

    reg [3:0] mem [0:7];
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < 8; i = i + 1) begin
                mem[i] <= 4'b1111;
            end
        end else begin
            mem[write_addr] <= write_data;
            read_data <= mem[read_addr];
        end
    end

endmodule

module input_signal_detector (
    input wire clk,
    input wire rst,
    input wire [31:0] input_signal,
    output reg [31:0] detection_output
);

    reg [31:0] prev_input;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            prev_input <= 32'hFFFFFFFF;
            detection_output <= 32'h00000000;
        end else begin
            detection_output <= (~input_signal) & prev_input;
            prev_input <= input_signal;
        end
    end

endmodule

module functional_module (
    input wire [3:0] ram_data,
    input wire [31:0] detection_data,
    output reg [3:0] func_output
);

    always @(*) begin
        case (detection_data)
            32'h00000001: func_output = ram_data;
            32'h00000002: func_output = ram_data;
            32'h00000004: func_output = ram_data;
            32'h00000008: func_output = ram_data;
            32'h00000010: func_output = ram_data;
            32'h00000020: func_output = ram_data;
            32'h00000040: func_output = ram_data;
            32'h00000080: func_output = ram_data;
            default: func_output = 4'b0000;
        endcase
    end

endmodule

module control_logic (
    input wire select,
    input wire [3:0] ram_data,
    input wire [3:0] func_data,
    output reg [3:0] output_data
);

    always @(*) begin
        if (select)
            output_data = func_data;
        else
            output_data = ram_data;
    end

endmodule