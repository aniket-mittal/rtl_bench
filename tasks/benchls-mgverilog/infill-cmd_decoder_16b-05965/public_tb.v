// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05965 dut (
    .cmd_in(in_vec[15:0]),
    .cmd_write(out_vec[26:26]),
    .cmd_write_stop(out_vec[25:25]),
    .cmd_read(out_vec[24:24]),
    .cmd_atomic_add(out_vec[23:23]),
    .cmd_atomic_and(out_vec[22:22]),
    .cmd_atomic_or(out_vec[21:21]),
    .cmd_atomic_xor(out_vec[20:20]),
    .cmd_cas(out_vec[19:19]),
    .cmd_opcode(out_vec[18:15]),
    .cmd_length(out_vec[14:11]),
    .cmd_size(out_vec[10:8]),
    .cmd_user(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h7b56;
    stim[1] = 16'hefdb;
    stim[2] = 16'he7e4;
    stim[3] = 16'hf6f2;
    stim[4] = 16'hd515;
    stim[5] = 16'hfdb6;
    stim[6] = 16'h9565;
    stim[7] = 16'h7464;
    stim[8] = 16'h5c9c;
    stim[9] = 16'h4d09;
    stim[10] = 16'hb724;
    stim[11] = 16'he2a1;
    stim[12] = 16'h0a10;
    stim[13] = 16'h8b3e;
    stim[14] = 16'hf673;
    stim[15] = 16'hfe97;
    stim[16] = 16'hfec4;
    stim[17] = 16'hc1aa;
    stim[18] = 16'he40f;
    stim[19] = 16'he49e;
    stim[20] = 16'hfb91;
    stim[21] = 16'h3442;
    stim[22] = 16'h4241;
    stim[23] = 16'h290d;
    stim[24] = 16'h9f8a;
    stim[25] = 16'h85d1;
    stim[26] = 16'hd329;
    stim[27] = 16'h6166;
    stim[28] = 16'h9e85;
    stim[29] = 16'h0221;
    stim[30] = 16'h9729;
    stim[31] = 16'h89d1;
    stim[32] = 16'hac0d;
    stim[33] = 16'hd47c;
    stim[34] = 16'h3622;
    stim[35] = 16'hc377;
    stim[36] = 16'ha5fe;
    stim[37] = 16'h75a2;
    stim[38] = 16'h9451;
    stim[39] = 16'h785f;
    stim[40] = 16'h20b8;
    stim[41] = 16'h8804;
    stim[42] = 16'h9925;
    stim[43] = 16'h4ae7;
    stim[44] = 16'h2fb2;
    stim[45] = 16'h7682;
    stim[46] = 16'h5337;
    stim[47] = 16'hbb59;
    stim[48] = 16'h95ad;
    stim[49] = 16'h5498;
    stim[50] = 16'he75d;
    stim[51] = 16'h4668;
    stim[52] = 16'h6fe7;
    stim[53] = 16'h32c7;
    stim[54] = 16'hb86d;
    stim[55] = 16'hb458;
    stim[56] = 16'h807c;
    stim[57] = 16'hf25e;
    stim[58] = 16'h5f9f;
    stim[59] = 16'h6840;
    stim[60] = 16'h126a;
    stim[61] = 16'h7d66;
    stim[62] = 16'h9ddf;
    stim[63] = 16'h1613;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 27'h40x2b7b;
      expv[1] = 27'h00xefef;
      expv[2] = 27'h40x77e7;
      expv[3] = 27'h40x7ef6;
      expv[4] = 27'h40x8dd5;
      expv[5] = 27'h40x5dfd;
      expv[6] = 27'h40xb595;
      expv[7] = 27'h40x3474;
      expv[8] = 27'h00x4c5c;
      expv[9] = 27'h00x854d;
      expv[10] = 27'h40x17b7;
      expv[11] = 27'h40xd2e2;
      expv[12] = 27'h40x0a0a;
      expv[13] = 27'h00x1b8b;
      expv[14] = 27'h40xbef6;
      expv[15] = 27'h40xcefe;
      expv[16] = 27'h40x66fe;
      expv[17] = 27'h00x51c1;
      expv[18] = 27'h00x84e4;
      expv[19] = 27'h00x4ce4;
      expv[20] = 27'h40xcbfb;
      expv[21] = 27'h40x2434;
      expv[22] = 27'h40xa242;
      expv[23] = 27'h00x8129;
      expv[24] = 27'h00x479f;
      expv[25] = 27'h40xed85;
      expv[26] = 27'h00x93d3;
      expv[27] = 27'h40x3161;
      expv[28] = 27'h40xc69e;
      expv[29] = 27'h40x9202;
      expv[30] = 27'h00x9797;
      expv[31] = 27'h40xe989;
      expv[32] = 27'h00x84ac;
      expv[33] = 27'h00x3cd4;
      expv[34] = 27'h40x1636;
      expv[35] = 27'h40xbbc3;
      expv[36] = 27'h00x7da5;
      expv[37] = 27'h40x5575;
      expv[38] = 27'h40xac94;
      expv[39] = 27'h00xa878;
      expv[40] = 27'h00x5820;
      expv[41] = 27'h40x0088;
      expv[42] = 27'h40x9199;
      expv[43] = 27'h40xf24a;
      expv[44] = 27'h40x5f2f;
      expv[45] = 27'h40x4676;
      expv[46] = 27'h40x9b53;
      expv[47] = 27'h00xabbb;
      expv[48] = 27'h00xd595;
      expv[49] = 27'h00x4c54;
      expv[50] = 27'h00xafe7;
      expv[51] = 27'h00x3646;
      expv[52] = 27'h40xf76f;
      expv[53] = 27'h40xe232;
      expv[54] = 27'h00xb0b8;
      expv[55] = 27'h00x2cb4;
      expv[56] = 27'h00x3880;
      expv[57] = 27'h00x2af2;
      expv[58] = 27'h00xcf5f;
      expv[59] = 27'h40x2068;
      expv[60] = 27'h00x3212;
      expv[61] = 27'h40x357d;
      expv[62] = 27'h00xed9d;
      expv[63] = 27'h40x8e16;
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
