// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002979 dut (
    .adc_clk(clk),
    .rst(in_vec[12:12]),
    .adc_data(in_vec[11:0]),
    .adc_buf_wr(out_vec[20:20]),
    .adc_buf_addr(out_vec[19:8]),
    .adc_buf_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1b1a;
    stim[1] = 13'h1d07;
    stim[2] = 13'h0d54;
    stim[3] = 13'h0277;
    stim[4] = 13'h0b3c;
    stim[5] = 13'h0903;
    stim[6] = 13'h0982;
    stim[7] = 13'h0cde;
    stim[8] = 13'h0637;
    stim[9] = 13'h0d34;
    stim[10] = 13'h035a;
    stim[11] = 13'h08d4;
    stim[12] = 13'h082c;
    stim[13] = 13'h0f48;
    stim[14] = 13'h0841;
    stim[15] = 13'h0f8f;
    stim[16] = 13'h0e6c;
    stim[17] = 13'h09dd;
    stim[18] = 13'h071c;
    stim[19] = 13'h05eb;
    stim[20] = 13'h0c36;
    stim[21] = 13'h0e91;
    stim[22] = 13'h001f;
    stim[23] = 13'h0a65;
    stim[24] = 13'h0c28;
    stim[25] = 13'h0735;
    stim[26] = 13'h09ba;
    stim[27] = 13'h0ac2;
    stim[28] = 13'h0d42;
    stim[29] = 13'h0334;
    stim[30] = 13'h0820;
    stim[31] = 13'h005b;
    stim[32] = 13'h09a0;
    stim[33] = 13'h0df5;
    stim[34] = 13'h0181;
    stim[35] = 13'h0275;
    stim[36] = 13'h08ce;
    stim[37] = 13'h0503;
    stim[38] = 13'h008c;
    stim[39] = 13'h0b23;
    stim[40] = 13'h0973;
    stim[41] = 13'h0e9e;
    stim[42] = 13'h0783;
    stim[43] = 13'h032b;
    stim[44] = 13'h02b3;
    stim[45] = 13'h03b9;
    stim[46] = 13'h039a;
    stim[47] = 13'h00b6;
    stim[48] = 13'h04e5;
    stim[49] = 13'h08c5;
    stim[50] = 13'h09fb;
    stim[51] = 13'h0ed9;
    stim[52] = 13'h0e2d;
    stim[53] = 13'h0ca6;
    stim[54] = 13'h0255;
    stim[55] = 13'h01b8;
    stim[56] = 13'h183d;
    stim[57] = 13'h07e1;
    stim[58] = 13'h0eb4;
    stim[59] = 13'h0062;
    stim[60] = 13'h0a06;
    stim[61] = 13'h0234;
    stim[62] = 13'h07fc;
    stim[63] = 13'h0c80;
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
      expv[0] = 21'h000000;
      expv[1] = 21'h000000;
      expv[2] = 21'h000000;
      expv[3] = 21'h000000;
      expv[4] = 21'h100180;
      expv[5] = 21'h1002aa;
      expv[6] = 21'h10036e;
      expv[7] = 21'h1004bc;
      expv[8] = 21'h100540;
      expv[9] = 21'h1006c1;
      expv[10] = 21'h1007fb;
      expv[11] = 21'h10086c;
      expv[12] = 21'h1009ac;
      expv[13] = 21'h100ada;
      expv[14] = 21'h100bab;
      expv[15] = 21'h100cb4;
      expv[16] = 21'h100d92;
      expv[17] = 21'h100e02;
      expv[18] = 21'h100f71;
      expv[19] = 21'h1010b6;
      expv[20] = 21'h10113b;
      expv[21] = 21'h1012b8;
      expv[22] = 21'h101357;
      expv[23] = 21'h1014ec;
      expv[24] = 21'h101509;
      expv[25] = 21'h101678;
      expv[26] = 21'h101726;
      expv[27] = 21'h101894;
      expv[28] = 21'h10192c;
      expv[29] = 21'h101add;
      expv[30] = 21'h101bc3;
      expv[31] = 21'h101cc2;
      expv[32] = 21'h101dac;
      expv[33] = 21'h101e84;
      expv[34] = 21'h101f5a;
      expv[35] = 21'h102085;
      expv[36] = 21'h10212f;
      expv[37] = 21'h102201;
      expv[38] = 21'h10232e;
      expv[39] = 21'h1024f3;
      expv[40] = 21'h102540;
      expv[41] = 21'h1026b1;
      expv[42] = 21'h102744;
      expv[43] = 21'h10284e;
      expv[44] = 21'h1029f9;
      expv[45] = 21'h102a41;
      expv[46] = 21'h102b54;
      expv[47] = 21'h102c4d;
      expv[48] = 21'h102d1d;
      expv[49] = 21'h102ed9;
      expv[50] = 21'h102fed;
      expv[51] = 21'h103027;
      expv[52] = 21'h103123;
      expv[53] = 21'h10325f;
      expv[54] = 21'h10331b;
      expv[55] = 21'h103434;
      expv[56] = 21'h000000;
      expv[57] = 21'h000000;
      expv[58] = 21'h000000;
      expv[59] = 21'h100180;
      expv[60] = 21'h100207;
      expv[61] = 21'h1003ad;
      expv[62] = 21'h1004c6;
      expv[63] = 21'h1005e0;
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
