// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03460 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h0bebd138;
    stim[1] = 31'h19e8220a;
    stim[2] = 31'h590d660e;
    stim[3] = 31'h59efddfd;
    stim[4] = 31'h631fbfae;
    stim[5] = 31'h737eaf94;
    stim[6] = 31'h488d787c;
    stim[7] = 31'h752545c1;
    stim[8] = 31'h5b05b96f;
    stim[9] = 31'h5aae7c58;
    stim[10] = 31'h6d2eac8f;
    stim[11] = 31'h54d860df;
    stim[12] = 31'h75b7a5ff;
    stim[13] = 31'h6abdb37e;
    stim[14] = 31'h67ffc4ad;
    stim[15] = 31'h6b1e108f;
    stim[16] = 31'h4705a074;
    stim[17] = 31'h5531d3d7;
    stim[18] = 31'h6bc02614;
    stim[19] = 31'h72fe77ba;
    stim[20] = 31'h7e3a8504;
    stim[21] = 31'h78366fea;
    stim[22] = 31'h58925faf;
    stim[23] = 31'h483e43eb;
    stim[24] = 31'h4bfc86e8;
    stim[25] = 31'h24415206;
    stim[26] = 31'h51368c4e;
    stim[27] = 31'h4285157d;
    stim[28] = 31'h5ad95c18;
    stim[29] = 31'h420f7e8a;
    stim[30] = 31'h44920489;
    stim[31] = 31'h70bc14bc;
    stim[32] = 31'h4d0ac47c;
    stim[33] = 31'h64dd255a;
    stim[34] = 31'h5e581c84;
    stim[35] = 31'h643e5c07;
    stim[36] = 31'h5a446b67;
    stim[37] = 31'h46e2bbbb;
    stim[38] = 31'h50bf44fe;
    stim[39] = 31'h52dce5fd;
    stim[40] = 31'h79a2eb05;
    stim[41] = 31'h777aad42;
    stim[42] = 31'h4acabd71;
    stim[43] = 31'h5a7de60f;
    stim[44] = 31'h554dc70d;
    stim[45] = 31'h70cddd3f;
    stim[46] = 31'h5512d57d;
    stim[47] = 31'h48222fe1;
    stim[48] = 31'h74282323;
    stim[49] = 31'h72c59465;
    stim[50] = 31'h6a72e8ce;
    stim[51] = 31'h66846082;
    stim[52] = 31'h49690b22;
    stim[53] = 31'h48634a1a;
    stim[54] = 31'h44ae3976;
    stim[55] = 31'h648ae94a;
    stim[56] = 31'h725750e7;
    stim[57] = 31'h6c0d885b;
    stim[58] = 31'h693d1156;
    stim[59] = 31'h6e34bf0e;
    stim[60] = 31'h71287832;
    stim[61] = 31'h6f8889ac;
    stim[62] = 31'h78401b14;
    stim[63] = 31'h531c436b;
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
      expv[0] = 36'hxxxxxxxxb;
      expv[1] = 36'hxxxxxxxxc;
      expv[2] = 36'hxxxxxxxxc;
      expv[3] = 36'hxxxxxxxx4;
      expv[4] = 36'hxxxxxxxx6;
      expv[5] = 36'h0000032fb;
      expv[6] = 36'h00000361e;
      expv[7] = 36'h000003611;
      expv[8] = 36'h000001223;
      expv[9] = 36'h000001229;
      expv[10] = 36'h000001221;
      expv[11] = 36'h000005d03;
      expv[12] = 36'h000005d0c;
      expv[13] = 36'h000003f09;
      expv[14] = 36'h0000014c1;
      expv[15] = 36'h000001f74;
      expv[16] = 36'h000002776;
      expv[17] = 36'h00000277e;
      expv[18] = 36'h00000277c;
      expv[19] = 36'h000004ed4;
      expv[20] = 36'h000001a9b;
      expv[21] = 36'h000002d91;
      expv[22] = 36'h000000bc3;
      expv[23] = 36'h000000bcb;
      expv[24] = 36'h000000bce;
      expv[25] = 36'h000000bcb;
      expv[26] = 36'h000000bce;
      expv[27] = 36'h000000bce;
      expv[28] = 36'h000000bc4;
      expv[29] = 36'h000000bc4;
      expv[30] = 36'h000000bc6;
      expv[31] = 36'h000000bcb;
      expv[32] = 36'h00000353e;
      expv[33] = 36'h00000353c;
      expv[34] = 36'h0000012f6;
      expv[35] = 36'h0000012f6;
      expv[36] = 36'h00000363c;
      expv[37] = 36'h00000363c;
      expv[38] = 36'h000003634;
      expv[39] = 36'h000003633;
      expv[40] = 36'h00000363c;
      expv[41] = 36'h000007f34;
      expv[42] = 36'h0000018d6;
      expv[43] = 36'h0000018dc;
      expv[44] = 36'h0000018d1;
      expv[45] = 36'h0000018d6;
      expv[46] = 36'h000006aee;
      expv[47] = 36'h000006aec;
      expv[48] = 36'h000006ae4;
      expv[49] = 36'h0000058e3;
      expv[50] = 36'h000002d1b;
      expv[51] = 36'h000003fde;
      expv[52] = 36'h000000a4c;
      expv[53] = 36'h000000a49;
      expv[54] = 36'h000000a41;
      expv[55] = 36'h000000a41;
      expv[56] = 36'h000002743;
      expv[57] = 36'h000002bdb;
      expv[58] = 36'h000003e2e;
      expv[59] = 36'h000000a39;
      expv[60] = 36'h000001374;
      expv[61] = 36'h0000021a3;
      expv[62] = 36'h0000032dc;
      expv[63] = 36'h000000254;
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
