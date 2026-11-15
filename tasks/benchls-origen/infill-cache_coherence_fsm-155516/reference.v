module origen_155516(
    input reset,
    input active_m1,
    input [2:0] cpu_action,
    input [1:0] i_state,
    input [1:0] processor,
    output reg writeback_block,
    output reg [1:0] f_state,
    output reg [1:0] processor_index,
    output reg [2:0] bus
);

initial begin
    writeback_block = 1'b0;
end

always @(posedge active_m1 or posedge reset) begin
    if (reset) begin
        f_state <= 2'b00;
        bus <= 3'b0;
        writeback_block <= 1'b0;
        processor_index <= processor;
    end
    else begin
        case (i_state)
            2'b00: begin
                if (cpu_action == 3'b010) begin
                    bus <= 3'b001;
                    f_state <= 2'b01;
                    writeback_block <= 1'b0;
                end
                else if (cpu_action == 3'b100) begin
                    bus <= 3'b010;
                    f_state <= 2'b10;
                    writeback_block <= 1'b0;
                end
                else begin
                    f_state <= i_state;
                    bus <= 3'b0;
                    writeback_block <= 1'b0;
                end
            end
            2'b01: begin
                if (cpu_action == 3'b001) begin
                    bus <= 3'b0;
                    f_state <= 2'b01;
                    writeback_block <= 1'b0;
                end
                else if (cpu_action == 3'b010) begin
                    bus <= 3'b001;
                    f_state <= 2'b01;
                    writeback_block <= 1'b0;
                end
                else if (cpu_action == 3'b011) begin
                    bus <= 3'b011;
                    f_state <= 2'b10;
                    writeback_block <= 1'b0;
                end
                else if (cpu_action == 3'b100) begin
                    bus <= 3'b010;
                    f_state <= 2'b10;
                    writeback_block <= 1'b0;
                end
                else begin
                    f_state <= i_state;
                    bus <= 3'b0;
                    writeback_block <= 1'b0;
                end
            end
            2'b10: begin
                if (cpu_action == 3'b001) begin
                    bus <= 3'b0;
                    f_state <= 2'b10;
                    writeback_block <= 1'b0;
                end
                else if (cpu_action == 3'b010) begin
                    bus <= 3'b001;
                    f_state <= 2'b01;
                    writeback_block <= 1'b1;
                end
                else if (cpu_action == 3'b011) begin
                    bus <= 3'b0;
                    f_state <= 2'b10;
                    writeback_block <= 1'b0;
                end
                else if (cpu_action == 3'b100) begin
                    bus <= 3'b010;
                    f_state <= 2'b10;
                    writeback_block <= 1'b1;
                end
                else begin
                    f_state <= i_state;
                    bus <= 3'b0;
                    writeback_block <= 1'b0;
                end
            end
            default: begin
                f_state <= 2'b00;
                bus <= 3'b0;
                writeback_block <= 1'b0;
                processor_index <= processor;
            end
        endcase
    end
end

endmodule