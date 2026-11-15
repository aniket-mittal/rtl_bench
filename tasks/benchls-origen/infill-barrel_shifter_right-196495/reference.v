module origen_196495(
    input [31:0] T,
    input [4:0] shamt,
    output reg [31:0] Y_lo,
    output reg C,
    output reg V,
    output reg N,
    output reg Z
);

always @(*) begin
    case (shamt)
        5'd0:  {C, Y_lo} = {T[0], T[31:1]};
        5'd1:  {C, Y_lo} = {T[0], T[31:1]};
        5'd2:  {C, Y_lo} = {T[1], T[31:2]};
        5'd3:  {C, Y_lo} = {T[2], T[31:3]};
        5'd4:  {C, Y_lo} = {T[3], T[31:4]};
        5'd5:  {C, Y_lo} = {T[4], T[31:5]};
        5'd6:  {C, Y_lo} = {T[5], T[31:6]};
        5'd7:  {C, Y_lo} = {T[6], T[31:7]};
        5'd8:  {C, Y_lo} = {T[7], T[31:8]};
        5'd9:  {C, Y_lo} = {T[8], T[31:9]};
        5'd10: {C, Y_lo} = {T[9], T[31:10]};
        5'd11: {C, Y_lo} = {T[10], T[31:11]};
        5'd12: {C, Y_lo} = {T[11], T[31:12]};
        5'd13: {C, Y_lo} = {T[12], T[31:13]};
        5'd14: {C, Y_lo} = {T[13], T[31:14]};
        5'd15: {C, Y_lo} = {T[14], T[31:15]};
        5'd16: {C, Y_lo} = {T[15], T[31:16]};
        5'd17: {C, Y_lo} = {T[16], T[31:17]};
        5'd18: {C, Y_lo} = {T[17], T[31:18]};
        5'd19: {C, Y_lo} = {T[18], T[31:19]};
        5'd20: {C, Y_lo} = {T[19], T[31:20]};
        5'd21: {C, Y_lo} = {T[20], T[31:21]};
        5'd22: {C, Y_lo} = {T[21], T[31:22]};
        5'd23: {C, Y_lo} = {T[22], T[31:23]};
        5'd24: {C, Y_lo} = {T[23], T[31:24]};
        5'd25: {C, Y_lo} = {T[24], T[31:25]};
        5'd26: {C, Y_lo} = {T[25], T[31:26]};
        5'd27: {C, Y_lo} = {T[26], T[31:27]};
        5'd28: {C, Y_lo} = {T[27], T[31:28]};
        5'd29: {C, Y_lo} = {T[28], T[31:29]};
        5'd30: {C, Y_lo} = {T[29], T[31:30]};
        5'd31: {C, Y_lo} = {T[30], T[31]};
        default: {C, Y_lo} = {T[0], T[31:1]};
    endcase

    V = 'x;
    N = Y_lo[31];
    Z = (Y_lo == 32'b0) ? 1'b1 : 1'b0;
end

endmodule