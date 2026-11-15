module origen_133599 #(
    parameter n = 8
)(
    input wire clk,
    input wire rst,
    input wire [n-1:0] int_signals,
    input wire [n-1:0] int_enables,
    input wire [n-1:0][2:0] pri,
    input wire ack,
    output reg intout
);

    reg [2:0] highest_pri;
    reg [n-1:0] active_ints;
    reg [n-1:0] serviced_ints;
    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            intout <= 0;
            highest_pri <= 0;
            active_ints <= 0;
            serviced_ints <= 0;
        end else begin
            // Determine active interrupts
            active_ints <= int_signals & int_enables & ~serviced_ints;

            // Find highest priority interrupt
            highest_pri <= 0;
            for (i = 0; i < n; i = i + 1) begin
                if (active_ints[i] && (pri[i] > highest_pri)) begin
                    highest_pri <= pri[i];
                end
            end

            // Assert interrupt output if there's an active interrupt
            intout <= |active_ints;

            // Mark interrupt as serviced when acknowledged
            if (ack) begin
                for (i = 0; i < n; i = i + 1) begin
                    if (active_ints[i] && (pri[i] == highest_pri)) begin
                        serviced_ints[i] <= 1;
                    end
                end
            end

            // Clear serviced interrupts when deasserted
            for (i = 0; i < n; i = i + 1) begin
                if (serviced_ints[i] && !int_signals[i]) begin
                    serviced_ints[i] <= 0;
                end
            end
        end
    end

endmodule