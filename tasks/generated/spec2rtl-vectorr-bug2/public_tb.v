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

  dut dut (
    .in(in_vec[7:0]),
    .out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h76;
    stim[1] = 8'hd2;
    stim[2] = 8'h11;
    stim[3] = 8'h17;
    stim[4] = 8'heb;
    stim[5] = 8'h6b;
    stim[6] = 8'h7f;
    stim[7] = 8'h31;
    stim[8] = 8'hb8;
    stim[9] = 8'h50;
    stim[10] = 8'h67;
    stim[11] = 8'hd3;
    stim[12] = 8'h9d;
    stim[13] = 8'h2a;
    stim[14] = 8'h48;
    stim[15] = 8'hfd;
    stim[16] = 8'h3c;
    stim[17] = 8'h4e;
    stim[18] = 8'hcb;
    stim[19] = 8'h1c;
    stim[20] = 8'h0e;
    stim[21] = 8'h5d;
    stim[22] = 8'h93;
    stim[23] = 8'h77;
    stim[24] = 8'hca;
    stim[25] = 8'h44;
    stim[26] = 8'h04;
    stim[27] = 8'h9b;
    stim[28] = 8'h43;
    stim[29] = 8'h7e;
    stim[30] = 8'h84;
    stim[31] = 8'h96;
    stim[32] = 8'hbb;
    stim[33] = 8'h24;
    stim[34] = 8'hf8;
    stim[35] = 8'hd5;
    stim[36] = 8'h6a;
    stim[37] = 8'hca;
    stim[38] = 8'h35;
    stim[39] = 8'h6e;
    stim[40] = 8'h1a;
    stim[41] = 8'h20;
    stim[42] = 8'hff;
    stim[43] = 8'hd6;
    stim[44] = 8'h3b;
    stim[45] = 8'h42;
    stim[46] = 8'hca;
    stim[47] = 8'heb;
    stim[48] = 8'h51;
    stim[49] = 8'hff;
    stim[50] = 8'h2f;
    stim[51] = 8'h84;
    stim[52] = 8'hea;
    stim[53] = 8'h19;
    stim[54] = 8'h35;
    stim[55] = 8'he6;
    stim[56] = 8'hbf;
    stim[57] = 8'he7;
    stim[58] = 8'h51;
    stim[59] = 8'hf2;
    stim[60] = 8'h35;
    stim[61] = 8'h9c;
    stim[62] = 8'h0b;
    stim[63] = 8'h63;
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
      expv[0] = 8'h6e;
      expv[1] = 8'h4b;
      expv[2] = 8'h88;
      expv[3] = 8'hcc;
      expv[4] = 8'hf3;
      expv[5] = 8'hf2;
      expv[6] = 8'hfe;
      expv[7] = 8'ha8;
      expv[8] = 8'h39;
      expv[9] = 8'h0a;
      expv[10] = 8'he6;
      expv[11] = 8'hcb;
      expv[12] = 8'h9d;
      expv[13] = 8'h70;
      expv[14] = 8'h12;
      expv[15] = 8'hbf;
      expv[16] = 8'h3c;
      expv[17] = 8'h56;
      expv[18] = 8'hd3;
      expv[19] = 8'h1c;
      expv[20] = 8'h54;
      expv[21] = 8'h9e;
      expv[22] = 8'hc9;
      expv[23] = 8'hee;
      expv[24] = 8'h53;
      expv[25] = 8'h06;
      expv[26] = 8'h04;
      expv[27] = 8'hd9;
      expv[28] = 8'hc2;
      expv[29] = 8'h7e;
      expv[30] = 8'h05;
      expv[31] = 8'h4d;
      expv[32] = 8'hf9;
      expv[33] = 8'h24;
      expv[34] = 8'h3b;
      expv[35] = 8'h8f;
      expv[36] = 8'h72;
      expv[37] = 8'h53;
      expv[38] = 8'hac;
      expv[39] = 8'h76;
      expv[40] = 8'h58;
      expv[41] = 8'h20;
      expv[42] = 8'hff;
      expv[43] = 8'h4f;
      expv[44] = 8'hf8;
      expv[45] = 8'h42;
      expv[46] = 8'h53;
      expv[47] = 8'hf3;
      expv[48] = 8'h8a;
      expv[49] = 8'hff;
      expv[50] = 8'hf4;
      expv[51] = 8'h05;
      expv[52] = 8'h73;
      expv[53] = 8'h98;
      expv[54] = 8'hac;
      expv[55] = 8'h67;
      expv[56] = 8'hfd;
      expv[57] = 8'he7;
      expv[58] = 8'h8a;
      expv[59] = 8'h6b;
      expv[60] = 8'hac;
      expv[61] = 8'h1d;
      expv[62] = 8'hd0;
      expv[63] = 8'he2;
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
