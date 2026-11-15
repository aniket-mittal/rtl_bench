// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07314 dut (
    .Clock(clk),
    .iRegistro(in_vec[11:4]),
    .iBits_a_correr(in_vec[3:0]),
    .oRegistro_corrido(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h6d9;
    stim[1] = 12'hd1d;
    stim[2] = 12'h0d5;
    stim[3] = 12'h1a5;
    stim[4] = 12'h1b0;
    stim[5] = 12'h3dc;
    stim[6] = 12'h486;
    stim[7] = 12'hb14;
    stim[8] = 12'he07;
    stim[9] = 12'h3e4;
    stim[10] = 12'hb01;
    stim[11] = 12'h8e6;
    stim[12] = 12'h7c5;
    stim[13] = 12'h98d;
    stim[14] = 12'h5ea;
    stim[15] = 12'h770;
    stim[16] = 12'h7f3;
    stim[17] = 12'hc26;
    stim[18] = 12'h36c;
    stim[19] = 12'h435;
    stim[20] = 12'h2b5;
    stim[21] = 12'hba7;
    stim[22] = 12'he82;
    stim[23] = 12'h03b;
    stim[24] = 12'hcc6;
    stim[25] = 12'h7a4;
    stim[26] = 12'h239;
    stim[27] = 12'h6f1;
    stim[28] = 12'hca9;
    stim[29] = 12'h48d;
    stim[30] = 12'h630;
    stim[31] = 12'hac3;
    stim[32] = 12'hc9e;
    stim[33] = 12'ha12;
    stim[34] = 12'hb3c;
    stim[35] = 12'hf5e;
    stim[36] = 12'hbf7;
    stim[37] = 12'h476;
    stim[38] = 12'hedf;
    stim[39] = 12'hb94;
    stim[40] = 12'h985;
    stim[41] = 12'h041;
    stim[42] = 12'h411;
    stim[43] = 12'hd4f;
    stim[44] = 12'h40b;
    stim[45] = 12'h03c;
    stim[46] = 12'hbc1;
    stim[47] = 12'h2b7;
    stim[48] = 12'he16;
    stim[49] = 12'h375;
    stim[50] = 12'h98f;
    stim[51] = 12'hbc4;
    stim[52] = 12'h3dc;
    stim[53] = 12'he30;
    stim[54] = 12'h982;
    stim[55] = 12'h88c;
    stim[56] = 12'ha56;
    stim[57] = 12'habb;
    stim[58] = 12'h495;
    stim[59] = 12'h819;
    stim[60] = 12'h619;
    stim[61] = 12'hbdd;
    stim[62] = 12'he42;
    stim[63] = 12'hc42;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'ha0;
      expv[4] = 8'h40;
      expv[5] = 8'h1b;
      expv[6] = 8'h1b;
      expv[7] = 8'h00;
      expv[8] = 8'h10;
      expv[9] = 8'h00;
      expv[10] = 8'he0;
      expv[11] = 8'h60;
      expv[12] = 8'h80;
      expv[13] = 8'h80;
      expv[14] = 8'h80;
      expv[15] = 8'h80;
      expv[16] = 8'h77;
      expv[17] = 8'hf8;
      expv[18] = 8'h80;
      expv[19] = 8'h80;
      expv[20] = 8'h60;
      expv[21] = 8'h60;
      expv[22] = 8'h00;
      expv[23] = 8'ha0;
      expv[24] = 8'ha0;
      expv[25] = 8'h00;
      expv[26] = 8'ha0;
      expv[27] = 8'ha0;
      expv[28] = 8'hde;
      expv[29] = 8'hde;
      expv[30] = 8'hde;
      expv[31] = 8'h63;
      expv[32] = 8'h60;
      expv[33] = 8'h60;
      expv[34] = 8'h84;
      expv[35] = 8'h84;
      expv[36] = 8'h84;
      expv[37] = 8'h80;
      expv[38] = 8'hc0;
      expv[39] = 8'hc0;
      expv[40] = 8'h90;
      expv[41] = 8'h00;
      expv[42] = 8'h08;
      expv[43] = 8'h82;
      expv[44] = 8'h82;
      expv[45] = 8'h82;
      expv[46] = 8'h82;
      expv[47] = 8'h78;
      expv[48] = 8'h80;
      expv[49] = 8'h40;
      expv[50] = 8'he0;
      expv[51] = 8'he0;
      expv[52] = 8'hc0;
      expv[53] = 8'hc0;
      expv[54] = 8'he3;
      expv[55] = 8'h60;
      expv[56] = 8'h60;
      expv[57] = 8'h40;
      expv[58] = 8'h40;
      expv[59] = 8'h20;
      expv[60] = 8'h20;
      expv[61] = 8'h20;
      expv[62] = 8'h20;
      expv[63] = 8'h90;
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
