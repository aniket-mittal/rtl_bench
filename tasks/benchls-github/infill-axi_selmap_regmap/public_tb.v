// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 46;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  axi_selmap_regmap dut (
    .up_clk(clk),
    .device_ready(in_vec[64:64]),
    .done(in_vec[63:63]),
    .up_rstn(in_vec[62:62]),
    .up_wreq(in_vec[61:61]),
    .up_waddr(in_vec[60:47]),
    .up_wdata(in_vec[46:15]),
    .up_rreq(in_vec[14:14]),
    .up_raddr(in_vec[13:0]),
    .reset(out_vec[45:45]),
    .data(out_vec[44:37]),
    .data_written(out_vec[36:36]),
    .csi_b(out_vec[35:35]),
    .program_b(out_vec[34:34]),
    .up_wack(out_vec[33:33]),
    .up_rdata(out_vec[32:1]),
    .up_rack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h18be1612c8a9eeddd;
    stim[1] = 65'h11fc6d7230b86a3a4;
    stim[2] = 65'h05bc6e9faf78e604e;
    stim[3] = 65'h1d56d729071772fd3;
    stim[4] = 65'h167292297b668d2b9;
    stim[5] = 65'h150ee4a32c0bfe134;
    stim[6] = 65'h1c554935662eae8a4;
    stim[7] = 65'h0f82b8dec5581502d;
    stim[8] = 65'h0e432be81366bef5b;
    stim[9] = 65'h1bd8a7902a63158e0;
    stim[10] = 65'h0ed236c2264232704;
    stim[11] = 65'h0f77ca74f6b91ba4b;
    stim[12] = 65'h1d06f0163f8a8df85;
    stim[13] = 65'h1eae021c77df8f23e;
    stim[14] = 65'h05b94d626d69b1b16;
    stim[15] = 65'h0fe6d10f08abdfe50;
    stim[16] = 65'h0fe7cfee88708eb9a;
    stim[17] = 65'h04d0b8d26239c3922;
    stim[18] = 65'h054edca893039d736;
    stim[19] = 65'h043e08c35b8777d8f;
    stim[20] = 65'h0dd2446c1115f68e5;
    stim[21] = 65'h14fc3f2d13f86b034;
    stim[22] = 65'h1f8bcc860abaff22d;
    stim[23] = 65'h0632d38b9e16e2679;
    stim[24] = 65'h0f4395518f40ec57d;
    stim[25] = 65'h0d30faae21b8b3769;
    stim[26] = 65'h0475fad08d8b3d235;
    stim[27] = 65'h163cb2e83c8f776b1;
    stim[28] = 65'h0f08b4deee8423b34;
    stim[29] = 65'h16fe6d9bee874f8eb;
    stim[30] = 65'h041efed394345410c;
    stim[31] = 65'h147fa06b8dabccf4c;
    stim[32] = 65'h0eea08cff8ff82731;
    stim[33] = 65'h1d48ff77e71f5d619;
    stim[34] = 65'h1ee81f3e2375b3e92;
    stim[35] = 65'h1cc33aa85ccf9be32;
    stim[36] = 65'h1c65e589651c32708;
    stim[37] = 65'h159aa5a68bc283ea1;
    stim[38] = 65'h148ed4c97902b62db;
    stim[39] = 65'h1f162c49cc5529913;
    stim[40] = 65'h1e93c9ed3a2ed0bc1;
    stim[41] = 65'h0c0689f3b24915808;
    stim[42] = 65'h04801b806f7fabafd;
    stim[43] = 65'h04dd87fec4e0982e5;
    stim[44] = 65'h1d959771f047026aa;
    stim[45] = 65'h1e0ccc0aceb501773;
    stim[46] = 65'h070623aab8ce55538;
    stim[47] = 65'h0685422d704804f63;
    stim[48] = 65'h04d6d42bb2de947df;
    stim[49] = 65'h163aa0fd59e708610;
    stim[50] = 65'h0e0008dcdc58d4f41;
    stim[51] = 65'h0da9fe6483898267d;
    stim[52] = 65'h05a3cc903f9c480d0;
    stim[53] = 65'h1c87b8b219dcf1938;
    stim[54] = 65'h0da67dd56a9d2db5a;
    stim[55] = 65'h17df12f68667a87c3;
    stim[56] = 65'h16ee6e220132775ed;
    stim[57] = 65'h1d899d5b15203fa43;
    stim[58] = 65'h0c4496181bee8a034;
    stim[59] = 65'h1ce22747ff2feda4e;
    stim[60] = 65'h04f8ef002e9e3ff20;
    stim[61] = 65'h0e2f3835128f3d0ef;
    stim[62] = 65'h06573f62ce847064d;
    stim[63] = 65'h06ac592a16e594444;
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
      expv[0] = 46'hxxxxxxxxxxxx;
      expv[1] = 46'h200x00000000;
      expv[2] = 46'h200x00000000;
      expv[3] = 46'h200c00000001;
      expv[4] = 46'h200c00000000;
      expv[5] = 46'h200e00000001;
      expv[6] = 46'h200c00000001;
      expv[7] = 46'h200c00000001;
      expv[8] = 46'h200e00000001;
      expv[9] = 46'h200e00000001;
      expv[10] = 46'h200e00000000;
      expv[11] = 46'h200e00000000;
      expv[12] = 46'h200e00000000;
      expv[13] = 46'h200c00000001;
      expv[14] = 46'h200e00000001;
      expv[15] = 46'h200c00000000;
      expv[16] = 46'h200e00000001;
      expv[17] = 46'h200e00000001;
      expv[18] = 46'h200c00000000;
      expv[19] = 46'h200c00000001;
      expv[20] = 46'h200c00000001;
      expv[21] = 46'h200c00000001;
      expv[22] = 46'h200c00000000;
      expv[23] = 46'h200e00000001;
      expv[24] = 46'h200e00000000;
      expv[25] = 46'h200e00000001;
      expv[26] = 46'h200c00000000;
      expv[27] = 46'h200c00000001;
      expv[28] = 46'h200e00000001;
      expv[29] = 46'h200e00000000;
      expv[30] = 46'h200e00000001;
      expv[31] = 46'h200c00000001;
      expv[32] = 46'h200c00000001;
      expv[33] = 46'h200e00000000;
      expv[34] = 46'h200c00000001;
      expv[35] = 46'h200e00000000;
      expv[36] = 46'h200c00000000;
      expv[37] = 46'h200c00000000;
      expv[38] = 46'h200c00000000;
      expv[39] = 46'h200c00000001;
      expv[40] = 46'h200e00000000;
      expv[41] = 46'h200e00000000;
      expv[42] = 46'h200c00000001;
      expv[43] = 46'h200c00000000;
      expv[44] = 46'h200c00000000;
      expv[45] = 46'h200c00000000;
      expv[46] = 46'h200e00000000;
      expv[47] = 46'h200e00000001;
      expv[48] = 46'h200e00000001;
      expv[49] = 46'h200c00000001;
      expv[50] = 46'h200e00000000;
      expv[51] = 46'h200e00000001;
      expv[52] = 46'h200c00000000;
      expv[53] = 46'h200c00000000;
      expv[54] = 46'h200c00000000;
      expv[55] = 46'h200c00000001;
      expv[56] = 46'h200e00000000;
      expv[57] = 46'h200e00000001;
      expv[58] = 46'h200c00000001;
      expv[59] = 46'h200c00000000;
      expv[60] = 46'h200c00000001;
      expv[61] = 46'h200c00000001;
      expv[62] = 46'h200e00000001;
      expv[63] = 46'h200e00000000;
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
