module origen_149834(
    input [31:0] dmem_in,
    input [2:0] load_type,
    input [3:0] byte_en,
    output reg [31:0] ext_out
);

// Declare the constants as parameters
parameter [2:0] LB = 3'b000, LBU = 3'b001, LH = 3'b010, LHU = 3'b011, LW = 3'b100;

always @(*) begin
    case (load_type)
        LB: begin
            case (byte_en)
                4'b0001: ext_out = {{24{dmem_in[7]}}, dmem_in[7:0]};
                4'b0010: ext_out = {{24{dmem_in[15]}}, dmem_in[15:8]};
                4'b0100: ext_out = {{24{dmem_in[23]}}, dmem_in[23:16]};
                4'b1000: ext_out = {{24{dmem_in[31]}}, dmem_in[31:24]};
                default: ext_out = 32'b0;
            endcase
        end
        LBU: begin
            case (byte_en)
                4'b0001: ext_out = {24'b0, dmem_in[7:0]};
                4'b0010: ext_out = {24'b0, dmem_in[15:8]};
                4'b0100: ext_out = {24'b0, dmem_in[23:16]};
                4'b1000: ext_out = {24'b0, dmem_in[31:24]};
                default: ext_out = 32'b0;
            endcase
        end
        LH: begin
            case (byte_en)
                4'b0011: ext_out = {{16{dmem_in[15]}}, dmem_in[15:0]};
                4'b1100: ext_out = {{16{dmem_in[31]}}, dmem_in[31:16]};
                default: ext_out = 32'b0;
            endcase
        end
        LHU: begin
            case (byte_en)
                4'b0011: ext_out = {16'b0, dmem_in[15:0]};
                4'b1100: ext_out = {16'b0, dmem_in[31:16]};
                default: ext_out = 32'b0;
            endcase
        end
        LW: begin
            ext_out = dmem_in;
        end
        default: ext_out = 32'b0;
    endcase
end

endmodule