// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  gf_mult_by_87 dut (
    .i(in_vec[7:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'hb7;
    stim[1] = 8'hbf;
    stim[2] = 8'hd3;
    stim[3] = 8'hec;
    stim[4] = 8'h09;
    stim[5] = 8'h9f;
    stim[6] = 8'h29;
    stim[7] = 8'h34;
    stim[8] = 8'h7d;
    stim[9] = 8'he0;
    stim[10] = 8'ha2;
    stim[11] = 8'h25;
    stim[12] = 8'hdb;
    stim[13] = 8'hbb;
    stim[14] = 8'hbe;
    stim[15] = 8'hdc;
    stim[16] = 8'h59;
    stim[17] = 8'h16;
    stim[18] = 8'hd3;
    stim[19] = 8'h21;
    stim[20] = 8'h8b;
    stim[21] = 8'hc3;
    stim[22] = 8'h06;
    stim[23] = 8'hcf;
    stim[24] = 8'hd6;
    stim[25] = 8'h13;
    stim[26] = 8'hff;
    stim[27] = 8'h9d;
    stim[28] = 8'hcc;
    stim[29] = 8'h0a;
    stim[30] = 8'h40;
    stim[31] = 8'h7b;
    stim[32] = 8'h3e;
    stim[33] = 8'h20;
    stim[34] = 8'h7f;
    stim[35] = 8'h4c;
    stim[36] = 8'h07;
    stim[37] = 8'hbe;
    stim[38] = 8'h7e;
    stim[39] = 8'h44;
    stim[40] = 8'h60;
    stim[41] = 8'h48;
    stim[42] = 8'h9c;
    stim[43] = 8'h23;
    stim[44] = 8'h46;
    stim[45] = 8'ha7;
    stim[46] = 8'h8b;
    stim[47] = 8'h2c;
    stim[48] = 8'hef;
    stim[49] = 8'h77;
    stim[50] = 8'h0f;
    stim[51] = 8'h56;
    stim[52] = 8'h84;
    stim[53] = 8'ha7;
    stim[54] = 8'h76;
    stim[55] = 8'h0e;
    stim[56] = 8'h81;
    stim[57] = 8'h42;
    stim[58] = 8'h25;
    stim[59] = 8'ha7;
    stim[60] = 8'h76;
    stim[61] = 8'h11;
    stim[62] = 8'heb;
    stim[63] = 8'h44;
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
      expv[0] = 8'hb3;
      expv[1] = 8'hff;
      expv[2] = 8'he2;
      expv[3] = 8'ha9;
      expv[4] = 8'hcb;
      expv[5] = 8'hd2;
      expv[6] = 8'he6;
      expv[7] = 8'h93;
      expv[8] = 8'h02;
      expv[9] = 8'hc3;
      expv[10] = 8'h8a;
      expv[11] = 8'h8c;
      expv[12] = 8'hae;
      expv[13] = 8'hd9;
      expv[14] = 8'h78;
      expv[15] = 8'h1c;
      expv[16] = 8'h09;
      expv[17] = 8'had;
      expv[18] = 8'he2;
      expv[19] = 8'haa;
      expv[20] = 8'h6c;
      expv[21] = 8'h7a;
      expv[22] = 8'h35;
      expv[23] = 8'h10;
      expv[24] = 8'h43;
      expv[25] = 8'h0c;
      expv[26] = 8'ha5;
      expv[27] = 8'hc1;
      expv[28] = 8'h84;
      expv[29] = 8'h5f;
      expv[30] = 8'h5a;
      expv[31] = 8'h37;
      expv[32] = 8'hcc;
      expv[33] = 8'h2d;
      expv[34] = 8'h11;
      expv[35] = 8'h30;
      expv[36] = 8'hb2;
      expv[37] = 8'h78;
      expv[38] = 8'h96;
      expv[39] = 8'h7c;
      expv[40] = 8'h77;
      expv[41] = 8'h16;
      expv[42] = 8'h46;
      expv[43] = 8'hb9;
      expv[44] = 8'h6f;
      expv[45] = 8'h2b;
      expv[46] = 8'h6c;
      expv[47] = 8'h47;
      expv[48] = 8'h3d;
      expv[49] = 8'h5d;
      expv[50] = 8'hfe;
      expv[51] = 8'hf7;
      expv[52] = 8'h92;
      expv[53] = 8'h2b;
      expv[54] = 8'hda;
      expv[55] = 8'h79;
      expv[56] = 8'h33;
      expv[57] = 8'h49;
      expv[58] = 8'h8c;
      expv[59] = 8'h2b;
      expv[60] = 8'hda;
      expv[61] = 8'h1f;
      expv[62] = 8'h1b;
      expv[63] = 8'h7c;
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
