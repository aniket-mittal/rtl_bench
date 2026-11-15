module autovcoder_104119 (
    input wire [31:0] a,
    input wire flagc,
    output wire [31:0] q,
    output wire c,
    input wire [4:0] shift
);

  reg [31:0] rq;
  reg cq;  // carry is 
  assign q = rq;
  assign c = cq;
  always @(a, shift, flagc) begin
    case (shift)
      5'h00: {rq, cq} = {a, flagc};
      5'h01: {rq, cq} = {flagc, a[31:0]};
      5'h02: {rq, cq} = {a[0:0], flagc, a[31:1]};
      5'h03: {rq, cq} = {a[1:0], flagc, a[31:2]};
      5'h04: {rq, cq} = {a[2:0], flagc, a[31:3]};
      5'h05: {rq, cq} = {a[3:0], flagc, a[31:4]};
      5'h06: {rq, cq} = {a[4:0], flagc, a[31:5]};
      5'h07: {rq, cq} = {a[5:0], flagc, a[31:6]};
      5'h08: {rq, cq} = {a[6:0], flagc, a[31:7]};
      5'h09: {rq, cq} = {a[7:0], flagc, a[31:8]};
      5'h0a: {rq, cq} = {a[8:0], flagc, a[31:9]};
      5'h0b: {rq, cq} = {a[9:0], flagc, a[31:10]};
      5'h0c: {rq, cq} = {a[10:0], flagc, a[31:11]};
      5'h0d: {rq, cq} = {a[11:0], flagc, a[31:12]};
      5'h0e: {rq, cq} = {a[12:0], flagc, a[31:13]};
      5'h0f: {rq, cq} = {a[13:0], flagc, a[31:14]};
      5'h10: {rq, cq} = {a[14:0], flagc, a[31:15]};
      5'h11: {rq, cq} = {a[15:0], flagc, a[31:16]};
      5'h12: {rq, cq} = {a[16:0], flagc, a[31:17]};
      5'h13: {rq, cq} = {a[17:0], flagc, a[31:18]};
      5'h14: {rq, cq} = {a[18:0], flagc, a[31:19]};
      5'h15: {rq, cq} = {a[19:0], flagc, a[31:20]};
      5'h16: {rq, cq} = {a[20:0], flagc, a[31:21]};
      5'h17: {rq, cq} = {a[21:0], flagc, a[31:22]};
      5'h18: {rq, cq} = {a[22:0], flagc, a[31:23]};
      5'h19: {rq, cq} = {a[23:0], flagc, a[31:24]};
      5'h1a: {rq, cq} = {a[24:0], flagc, a[31:25]};
      5'h1b: {rq, cq} = {a[25:0], flagc, a[31:26]};
      5'h1c: {rq, cq} = {a[26:0], flagc, a[31:27]};
      5'h1d: {rq, cq} = {a[27:0], flagc, a[31:28]};
      5'h1e: {rq, cq} = {a[28:0], flagc, a[31:29]};
      5'h1f: {rq, cq} = {a[29:0], flagc, a[31:30]};
    endcase
  end
endmodule

