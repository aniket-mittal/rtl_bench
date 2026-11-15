module origen_041270 (
    input [31:0] original_data,
    input [2:0] loadtype,
    input [1:0] addr_low,
    output reg [31:0] final_data
);

    // Load operation types
    parameter LOAD_LB  = 3'd0;
    parameter LOAD_LBU = 3'd1;
    parameter LOAD_LH  = 3'd2;
    parameter LOAD_LHU = 3'd3;
    parameter LOAD_LW  = 3'd4;

    always @(*) begin
        case (loadtype)
            LOAD_LB: begin
                case (addr_low)
                    2'b00: final_data = {{24{original_data[7]}}, original_data[7:0]};
                    2'b01: final_data = {{24{original_data[15]}}, original_data[15:8]};
                    2'b10: final_data = {{24{original_data[23]}}, original_data[23:16]};
                    2'b11: final_data = {{24{original_data[31]}}, original_data[31:24]};
                endcase
            end
            LOAD_LBU: begin
                case (addr_low)
                    2'b00: final_data = {24'b0, original_data[7:0]};
                    2'b01: final_data = {24'b0, original_data[15:8]};
                    2'b10: final_data = {24'b0, original_data[23:16]};
                    2'b11: final_data = {24'b0, original_data[31:24]};
                endcase
            end
            LOAD_LH: begin
                case (addr_low[1])
                    1'b0: final_data = {{16{original_data[15]}}, original_data[15:0]};
                    1'b1: final_data = {{16{original_data[31]}}, original_data[31:16]};
                endcase
            end
            LOAD_LHU: begin
                case (addr_low[1])
                    1'b0: final_data = {16'b0, original_data[15:0]};
                    1'b1: final_data = {16'b0, original_data[31:16]};
                endcase
            end
            LOAD_LW: final_data = original_data;
            default: final_data = 32'b0;
        endcase
    end

endmodule