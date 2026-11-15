// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138638 dut (
    .clk(clk),
    .data_in(in_vec[31:0]),
    .data_out(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h8e20d8b4;
    stim[1] = 32'hedab398e;
    stim[2] = 32'heb807756;
    stim[3] = 32'hc80a6536;
    stim[4] = 32'h31987353;
    stim[5] = 32'h9a4a95f4;
    stim[6] = 32'hac0a9d55;
    stim[7] = 32'h4bf82d05;
    stim[8] = 32'h7ec69703;
    stim[9] = 32'hdcec9524;
    stim[10] = 32'hb50d05be;
    stim[11] = 32'h6133f7fd;
    stim[12] = 32'h0e3a7192;
    stim[13] = 32'hdc47c660;
    stim[14] = 32'h664888d6;
    stim[15] = 32'heecb2643;
    stim[16] = 32'hf28bea67;
    stim[17] = 32'heceec7e9;
    stim[18] = 32'hbb8e01eb;
    stim[19] = 32'h36725bd2;
    stim[20] = 32'h3ec36a8d;
    stim[21] = 32'h181f4555;
    stim[22] = 32'hf2a66feb;
    stim[23] = 32'h46198641;
    stim[24] = 32'ha72bcb8a;
    stim[25] = 32'h439d55dd;
    stim[26] = 32'hcd280ca2;
    stim[27] = 32'h69f78e3c;
    stim[28] = 32'hd588db6d;
    stim[29] = 32'hd04eb0f1;
    stim[30] = 32'hdf76e13e;
    stim[31] = 32'h76240830;
    stim[32] = 32'h05a9f730;
    stim[33] = 32'h554712bb;
    stim[34] = 32'hc9dbd536;
    stim[35] = 32'ha0f1aa4b;
    stim[36] = 32'h5b7b794f;
    stim[37] = 32'h6e21200b;
    stim[38] = 32'h732d09e0;
    stim[39] = 32'hd60b338e;
    stim[40] = 32'h5f4bb740;
    stim[41] = 32'hfe86b99f;
    stim[42] = 32'hb14cbb6a;
    stim[43] = 32'he981be23;
    stim[44] = 32'h30fb200a;
    stim[45] = 32'hec284803;
    stim[46] = 32'h91e8c595;
    stim[47] = 32'h4a491307;
    stim[48] = 32'h4b9db6d0;
    stim[49] = 32'h26640960;
    stim[50] = 32'he0f8f864;
    stim[51] = 32'h5828c181;
    stim[52] = 32'h74639a9d;
    stim[53] = 32'h14e5381e;
    stim[54] = 32'h3c82575b;
    stim[55] = 32'hca4edcd4;
    stim[56] = 32'h0efd11a1;
    stim[57] = 32'h72bc263c;
    stim[58] = 32'h451c6000;
    stim[59] = 32'h4a77b7b7;
    stim[60] = 32'h6f96b3dd;
    stim[61] = 32'h2b66dfc8;
    stim[62] = 32'hbcfa31ae;
    stim[63] = 32'h48665d46;
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
      expv[0] = 3'hx;
      expv[1] = 3'h7;
      expv[2] = 3'hx;
      expv[3] = 3'hx;
      expv[4] = 3'h5;
      expv[5] = 3'h7;
      expv[6] = 3'h6;
      expv[7] = 3'h3;
      expv[8] = 3'h7;
      expv[9] = 3'h6;
      expv[10] = 3'h5;
      expv[11] = 3'h1;
      expv[12] = 3'h7;
      expv[13] = 3'h6;
      expv[14] = 3'h6;
      expv[15] = 3'h6;
      expv[16] = 3'h6;
      expv[17] = 3'h6;
      expv[18] = 3'h7;
      expv[19] = 3'h7;
      expv[20] = 3'h6;
      expv[21] = 3'h6;
      expv[22] = 3'h2;
      expv[23] = 3'h6;
      expv[24] = 3'h7;
      expv[25] = 3'h3;
      expv[26] = 3'h7;
      expv[27] = 3'h5;
      expv[28] = 3'h5;
      expv[29] = 3'h1;
      expv[30] = 3'h7;
      expv[31] = 3'h7;
      expv[32] = 3'h7;
      expv[33] = 3'h5;
      expv[34] = 3'h5;
      expv[35] = 3'h5;
      expv[36] = 3'h7;
      expv[37] = 3'h7;
      expv[38] = 3'h3;
      expv[39] = 3'h7;
      expv[40] = 3'h7;
      expv[41] = 3'h7;
      expv[42] = 3'h3;
      expv[43] = 3'h5;
      expv[44] = 3'h5;
      expv[45] = 3'h4;
      expv[46] = 3'h1;
      expv[47] = 3'h3;
      expv[48] = 3'h3;
      expv[49] = 3'h7;
      expv[50] = 3'h2;
      expv[51] = 3'h0;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h2;
      expv[56] = 3'h6;
      expv[57] = 3'h6;
      expv[58] = 3'h7;
      expv[59] = 3'h3;
      expv[60] = 3'h7;
      expv[61] = 3'h3;
      expv[62] = 3'h7;
      expv[63] = 3'h0;
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
