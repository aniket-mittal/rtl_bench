// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00398 dut (
    .CLK(clk),
    .DATA_IN(in_vec[42:35]),
    .RESET(in_vec[34:34]),
    .START(in_vec[33:33]),
    .LOAD(in_vec[32:32]),
    .CRC_IN(in_vec[31:0]),
    .CRC_OUT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h52cb6b34109;
    stim[1] = 43'h37fc55fa157;
    stim[2] = 43'h39a6cb4b900;
    stim[3] = 43'h373edd48dfd;
    stim[4] = 43'h221c535b278;
    stim[5] = 43'h46811f2c81c;
    stim[6] = 43'h2b8c09bbc3c;
    stim[7] = 43'h669d52a8bb6;
    stim[8] = 43'h648243002d1;
    stim[9] = 43'h3c8adf43a15;
    stim[10] = 43'h02b990162a1;
    stim[11] = 43'h14050e0a817;
    stim[12] = 43'h14bddc7466b;
    stim[13] = 43'h23a15caada8;
    stim[14] = 43'h5ba0b66d20c;
    stim[15] = 43'h7b14b0a33ae;
    stim[16] = 43'h1d27c85d6ea;
    stim[17] = 43'h73b90dda950;
    stim[18] = 43'h4b240b8b0b8;
    stim[19] = 43'h2bb53f59608;
    stim[20] = 43'h4309949f3a3;
    stim[21] = 43'h57928d5cc5c;
    stim[22] = 43'h019d293e305;
    stim[23] = 43'h2fbcd054814;
    stim[24] = 43'h7294e95bd63;
    stim[25] = 43'h1793774488e;
    stim[26] = 43'h6ea291a8d0d;
    stim[27] = 43'h5d87c4de7ec;
    stim[28] = 43'h3f3702f7780;
    stim[29] = 43'h1ab086ed710;
    stim[30] = 43'h713875770b5;
    stim[31] = 43'h11b1103b87b;
    stim[32] = 43'h1623c48e01d;
    stim[33] = 43'h4107f6d61d6;
    stim[34] = 43'h0e15956c47a;
    stim[35] = 43'h3aaecdfa3b6;
    stim[36] = 43'h7f2374054e0;
    stim[37] = 43'h548f0a49670;
    stim[38] = 43'h511037358d5;
    stim[39] = 43'h250a8794f4a;
    stim[40] = 43'h64262032969;
    stim[41] = 43'h1e3027c846b;
    stim[42] = 43'h6bb7de4eb20;
    stim[43] = 43'h4b20e6d0b5e;
    stim[44] = 43'h7b03795f7db;
    stim[45] = 43'h2a170a5ba93;
    stim[46] = 43'h1109e382346;
    stim[47] = 43'h0d009fe2a77;
    stim[48] = 43'h5e83994b32c;
    stim[49] = 43'h370a31fce78;
    stim[50] = 43'h6180e97640f;
    stim[51] = 43'h08a58e77987;
    stim[52] = 43'h68a2a4f88ee;
    stim[53] = 43'h758c92b9a61;
    stim[54] = 43'h33376e23486;
    stim[55] = 43'h75688f22c03;
    stim[56] = 43'h36b7b27796d;
    stim[57] = 43'h502c9795049;
    stim[58] = 43'h01075718df6;
    stim[59] = 43'h601dceccb8f;
    stim[60] = 43'h13853c11233;
    stim[61] = 43'h1aa573de8f3;
    stim[62] = 43'h5292a6f0733;
    stim[63] = 43'h07b5d6e8ed3;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hedf73b3e;
      expv[4] = 32'h9374f837;
      expv[5] = 32'hc535b278;
      expv[6] = 32'hc535b278;
      expv[7] = 32'hc535b278;
      expv[8] = 32'hd52a8bb6;
      expv[9] = 32'hd52a8bb6;
      expv[10] = 32'hd52a8bb6;
      expv[11] = 32'h3b10fde9;
      expv[12] = 32'h3b10fde9;
      expv[13] = 32'h556e091e;
      expv[14] = 32'h2b9afe1e;
      expv[15] = 32'h8aefbefa;
      expv[16] = 32'h4b0a33ae;
      expv[17] = 32'hee46ae50;
      expv[18] = 32'h6467a00f;
      expv[19] = 32'he79ac967;
      expv[20] = 32'h27f7ea7e;
      expv[21] = 32'h27f7ea7e;
      expv[22] = 32'h28d5cc5c;
      expv[23] = 32'hd293e305;
      expv[24] = 32'hcb22633d;
      expv[25] = 32'h4e95bd63;
      expv[26] = 32'h3774488e;
      expv[27] = 32'h9e6b7eaf;
      expv[28] = 32'h9e6b7eaf;
      expv[29] = 32'haed78979;
      expv[30] = 32'hd9df89ff;
      expv[31] = 32'h20f059f1;
      expv[32] = 32'hfd1ad7d9;
      expv[33] = 32'h0f8d8f5e;
      expv[34] = 32'h0f8d8f5e;
      expv[35] = 32'h5956c47a;
      expv[36] = 32'hfbeb5784;
      expv[37] = 32'hfc92ef6b;
      expv[38] = 32'hfc92ef6b;
      expv[39] = 32'h037358d5;
      expv[40] = 32'h037358d5;
      expv[41] = 32'h05998ef8;
      expv[42] = 32'h6f75659f;
      expv[43] = 32'hee53ffc6;
      expv[44] = 32'h9543365f;
      expv[45] = 32'h9543365f;
      expv[46] = 32'h70a5ba93;
      expv[47] = 32'h70a5ba93;
      expv[48] = 32'h70a5ba93;
      expv[49] = 32'h70a5ba93;
      expv[50] = 32'h70a5ba93;
      expv[51] = 32'h70a5ba93;
      expv[52] = 32'h0dde4820;
      expv[53] = 32'hfadff08d;
      expv[54] = 32'hfadff08d;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h9d684044;
      expv[58] = 32'h8dbfaf43;
      expv[59] = 32'h8dbfaf43;
      expv[60] = 32'hdceccb8f;
      expv[61] = 32'hdceccb8f;
      expv[62] = 32'h0bab5976;
      expv[63] = 32'h2a6f0733;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
