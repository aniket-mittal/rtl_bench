// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093165 dut (
    .CLOCK_65(clk),
    .rst(in_vec[31:31]),
    .start_write(in_vec[30:30]),
    .monitor_ADC(in_vec[29:16]),
    .sram_readdata(in_vec[15:0]),
    .sram_writedata(out_vec[40:25]),
    .sram_address(out_vec[24:18]),
    .sram_write(out_vec[17:17]),
    .Vpp(out_vec[16:1]),
    .rfsig_state(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'he45e2134;
    stim[1] = 32'hdbe1511d;
    stim[2] = 32'h7aa48ff3;
    stim[3] = 32'h12e9a7a4;
    stim[4] = 32'h3325d0de;
    stim[5] = 32'h0cd9d6fa;
    stim[6] = 32'h351bf873;
    stim[7] = 32'h56c7e27a;
    stim[8] = 32'h642d40ca;
    stim[9] = 32'h1f6f5fd2;
    stim[10] = 32'h2820d5ec;
    stim[11] = 32'h76d98cbe;
    stim[12] = 32'h0efe2a46;
    stim[13] = 32'h17aa8c52;
    stim[14] = 32'h2b1e3991;
    stim[15] = 32'h356fd3f2;
    stim[16] = 32'h13ef8eb9;
    stim[17] = 32'h6e90d1c3;
    stim[18] = 32'h3dc664c5;
    stim[19] = 32'h7b6a19d1;
    stim[20] = 32'h2e121bce;
    stim[21] = 32'h1fc2952d;
    stim[22] = 32'h1e38a6a1;
    stim[23] = 32'h1ee6e4f8;
    stim[24] = 32'h40f6562b;
    stim[25] = 32'h60c22861;
    stim[26] = 32'h6d2de2da;
    stim[27] = 32'h1ef689d3;
    stim[28] = 32'h5f01719c;
    stim[29] = 32'h6e534d09;
    stim[30] = 32'h016d56ef;
    stim[31] = 32'h49e78081;
    stim[32] = 32'h77be3a1d;
    stim[33] = 32'h744758ad;
    stim[34] = 32'h7bc845e9;
    stim[35] = 32'h4b5d4517;
    stim[36] = 32'h5e7f2574;
    stim[37] = 32'h2a6495b6;
    stim[38] = 32'h1cc6903a;
    stim[39] = 32'h0ebbee43;
    stim[40] = 32'h5a2b6d76;
    stim[41] = 32'h60993e6e;
    stim[42] = 32'h23dbb94d;
    stim[43] = 32'h1cb8bbab;
    stim[44] = 32'h04f6b357;
    stim[45] = 32'h5f45472e;
    stim[46] = 32'h7198a666;
    stim[47] = 32'h71326169;
    stim[48] = 32'h50951616;
    stim[49] = 32'h78a23ab9;
    stim[50] = 32'h43e8ed15;
    stim[51] = 32'h475f1aa1;
    stim[52] = 32'h7a640498;
    stim[53] = 32'h52ed9474;
    stim[54] = 32'h13d7f61b;
    stim[55] = 32'h045935a7;
    stim[56] = 32'h381910b1;
    stim[57] = 32'h343b1218;
    stim[58] = 32'h4797e7f3;
    stim[59] = 32'h75f20927;
    stim[60] = 32'hc30ebce5;
    stim[61] = 32'h3161f7fb;
    stim[62] = 32'h4854cd3f;
    stim[63] = 32'h654afef4;
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
      expv[0] = 41'h00000000000;
      expv[1] = 41'h00000000000;
      expv[2] = 41'h00000000000;
      expv[3] = 41'h00000000000;
      expv[4] = 41'h00000000000;
      expv[5] = 41'h00000000000;
      expv[6] = 41'h00000000000;
      expv[7] = 41'h00000000000;
      expv[8] = 41'h00000000000;
      expv[9] = 41'h00000000000;
      expv[10] = 41'h00000000000;
      expv[11] = 41'h00000000000;
      expv[12] = 41'h00000000000;
      expv[13] = 41'h00000000000;
      expv[14] = 41'h00000000000;
      expv[15] = 41'h00000000000;
      expv[16] = 41'h00000000000;
      expv[17] = 41'h00000000000;
      expv[18] = 41'h00000000000;
      expv[19] = 41'h00000000000;
      expv[20] = 41'h00000000000;
      expv[21] = 41'h00000000000;
      expv[22] = 41'h00000000000;
      expv[23] = 41'h00000000000;
      expv[24] = 41'h00000000000;
      expv[25] = 41'h00000000000;
      expv[26] = 41'h00000000000;
      expv[27] = 41'h00000000000;
      expv[28] = 41'h00000000000;
      expv[29] = 41'h00000000000;
      expv[30] = 41'h00000000000;
      expv[31] = 41'h00000000000;
      expv[32] = 41'h00000000000;
      expv[33] = 41'h00000000000;
      expv[34] = 41'h00000000000;
      expv[35] = 41'h00000000000;
      expv[36] = 41'h00000000000;
      expv[37] = 41'h00000000000;
      expv[38] = 41'h00000000000;
      expv[39] = 41'h00000000000;
      expv[40] = 41'h00000000000;
      expv[41] = 41'h00000000000;
      expv[42] = 41'h00000000000;
      expv[43] = 41'h00000000000;
      expv[44] = 41'h00000000000;
      expv[45] = 41'h00000000000;
      expv[46] = 41'h00000000000;
      expv[47] = 41'h00000000000;
      expv[48] = 41'h00000000000;
      expv[49] = 41'h00000000000;
      expv[50] = 41'h00000000000;
      expv[51] = 41'h00000000000;
      expv[52] = 41'h00000000000;
      expv[53] = 41'h00000000000;
      expv[54] = 41'h00000000000;
      expv[55] = 41'h00000000000;
      expv[56] = 41'h00000000000;
      expv[57] = 41'h00000000000;
      expv[58] = 41'h00000000000;
      expv[59] = 41'h00000000000;
      expv[60] = 41'h00000000000;
      expv[61] = 41'h00000000000;
      expv[62] = 41'h00000000000;
      expv[63] = 41'h00000000000;
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
