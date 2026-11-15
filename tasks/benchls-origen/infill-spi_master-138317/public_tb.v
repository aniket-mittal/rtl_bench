// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_138317 dut (
    .clk(clk),
    .send_data(in_vec[11:4]),
    .begin_transmission(in_vec[3:3]),
    .slave_select(in_vec[2:2]),
    .miso(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .recieved_data(out_vec[10:3]),
    .end_transmission(out_vec[2:2]),
    .mosi(out_vec[1:1]),
    .sclk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hadf;
    stim[1] = 12'h9b1;
    stim[2] = 12'hb9a;
    stim[3] = 12'hb7c;
    stim[4] = 12'h58c;
    stim[5] = 12'he6a;
    stim[6] = 12'h8c2;
    stim[7] = 12'h88e;
    stim[8] = 12'h166;
    stim[9] = 12'hf30;
    stim[10] = 12'he16;
    stim[11] = 12'h9a2;
    stim[12] = 12'hbac;
    stim[13] = 12'h994;
    stim[14] = 12'hb88;
    stim[15] = 12'h4ce;
    stim[16] = 12'h940;
    stim[17] = 12'h1ea;
    stim[18] = 12'h466;
    stim[19] = 12'hc96;
    stim[20] = 12'h1bc;
    stim[21] = 12'h86a;
    stim[22] = 12'h302;
    stim[23] = 12'hf24;
    stim[24] = 12'h9ec;
    stim[25] = 12'hbb2;
    stim[26] = 12'hb22;
    stim[27] = 12'h99e;
    stim[28] = 12'hd82;
    stim[29] = 12'h3a8;
    stim[30] = 12'hcc2;
    stim[31] = 12'h180;
    stim[32] = 12'h448;
    stim[33] = 12'h008;
    stim[34] = 12'hbd2;
    stim[35] = 12'h8ae;
    stim[36] = 12'hddc;
    stim[37] = 12'h350;
    stim[38] = 12'h130;
    stim[39] = 12'hb12;
    stim[40] = 12'h0d6;
    stim[41] = 12'h342;
    stim[42] = 12'h17c;
    stim[43] = 12'h9a8;
    stim[44] = 12'h770;
    stim[45] = 12'h262;
    stim[46] = 12'h190;
    stim[47] = 12'he3e;
    stim[48] = 12'h49c;
    stim[49] = 12'h842;
    stim[50] = 12'h5fa;
    stim[51] = 12'h28c;
    stim[52] = 12'h662;
    stim[53] = 12'h3e8;
    stim[54] = 12'h7fe;
    stim[55] = 12'he5a;
    stim[56] = 12'h3c8;
    stim[57] = 12'hb22;
    stim[58] = 12'hd98;
    stim[59] = 12'h360;
    stim[60] = 12'hec6;
    stim[61] = 12'h6ca;
    stim[62] = 12'h15a;
    stim[63] = 12'h0b0;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h001;
      expv[21] = 11'h001;
      expv[22] = 11'h001;
      expv[23] = 11'h001;
      expv[24] = 11'h001;
      expv[25] = 11'h001;
      expv[26] = 11'h001;
      expv[27] = 11'h001;
      expv[28] = 11'h001;
      expv[29] = 11'h001;
      expv[30] = 11'h001;
      expv[31] = 11'h001;
      expv[32] = 11'h001;
      expv[33] = 11'h001;
      expv[34] = 11'h001;
      expv[35] = 11'h001;
      expv[36] = 11'h002;
      expv[37] = 11'h002;
      expv[38] = 11'h002;
      expv[39] = 11'h002;
      expv[40] = 11'h002;
      expv[41] = 11'h002;
      expv[42] = 11'h002;
      expv[43] = 11'h002;
      expv[44] = 11'h002;
      expv[45] = 11'h002;
      expv[46] = 11'h002;
      expv[47] = 11'h002;
      expv[48] = 11'h002;
      expv[49] = 11'h002;
      expv[50] = 11'h002;
      expv[51] = 11'h002;
      expv[52] = 11'h003;
      expv[53] = 11'h003;
      expv[54] = 11'h003;
      expv[55] = 11'h003;
      expv[56] = 11'h003;
      expv[57] = 11'h003;
      expv[58] = 11'h003;
      expv[59] = 11'h003;
      expv[60] = 11'h003;
      expv[61] = 11'h003;
      expv[62] = 11'h003;
      expv[63] = 11'h003;
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
