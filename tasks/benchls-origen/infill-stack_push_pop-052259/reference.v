module origen_052259 #(
    parameter CPU_BIT_WIDTH = 32,
    parameter stack_addr_bits = 4,
    parameter stack_addr_max = (1 << stack_addr_bits) - 1
)(
    input wire [CPU_BIT_WIDTH-1:0] data_in,
    input wire reset,
    input wire clk,
    input wire push,
    input wire pop,
    output reg [CPU_BIT_WIDTH-1:0] data_out,
    output reg [stack_addr_bits:0] sp,
    output reg full
);

    reg [CPU_BIT_WIDTH-1:0] mem [0:stack_addr_max];
    integer i;

    always @(posedge clk) begin
        if (reset) begin
            sp <= -1;
            full <= 0;
            data_out <= 0;
            for (i = 0; i <= stack_addr_max; i = i + 1) begin
                mem[i] <= 0;
            end
        end
        else if (push && pop) begin
            data_out <= data_in;
        end
        else if (push) begin
            if (sp < stack_addr_max) begin
                sp <= sp + 1;
                mem[sp + 1] <= data_in;
                full <= (sp == stack_addr_max - 1);
            end
        end
        else if (pop) begin
            if (sp >= 0) begin
                data_out <= mem[sp];
                sp <= (sp == 0) ? -1 : sp - 1;
                full <= 0;
            end
            else begin
                sp <= -1;
            end
        end
    end

endmodule