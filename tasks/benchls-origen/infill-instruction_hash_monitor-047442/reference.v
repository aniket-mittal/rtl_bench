module origen_047442 (
    input wire core_sp_clk,
    input wire [31:0] instruction_sec_mon,
    input wire [13:2] read_address,
    input wire hash_int_ACK,
    input wire reset,
    output reg [3:0] hash_value,
    output reg new_inst_signal
);

reg [31:0] instruction_old_value;
reg [13:2] read_address_old_value;
reg [13:2] read_address_reg;
reg [5:0] data;
reg [3:0] hash_result;
reg new_inst_signal_reg;
reg new_inst_signal_reg_test;

always @(posedge core_sp_clk or posedge reset) begin
    if (reset) begin
        data <= 6'b0;
        hash_result <= 4'b0;
        instruction_old_value <= 32'b0;
        read_address_old_value <= 12'b0;
    end else begin
        if (instruction_sec_mon != instruction_old_value && hash_int_ACK) begin
            data <= instruction_sec_mon[31:26] + instruction_sec_mon[25:20] + 
                    instruction_sec_mon[19:14] + instruction_sec_mon[13:8] + 
                    instruction_sec_mon[7:2] + {4'b0, instruction_sec_mon[1:0]};
            hash_result <= data % 16;
            new_inst_signal_reg <= 1'b1;
        end else begin
            new_inst_signal_reg <= 1'b0;
        end

        instruction_old_value <= instruction_sec_mon;
        read_address_reg <= read_address;

        if (read_address != read_address_old_value && hash_int_ACK) begin
            new_inst_signal_reg_test <= 1'b1;
        end else begin
            new_inst_signal_reg_test <= 1'b0;
        end

        read_address_old_value <= read_address;
    end
end

always @(*) begin
    hash_value = hash_result;
    new_inst_signal = new_inst_signal_reg_test;
end

endmodule