// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000580 dut (
    .spi_clk(clk),
    .spi_cs(in_vec[19:19]),
    .reset(in_vec[18:18]),
    .spi_miso(in_vec[17:17]),
    .spi_data(in_vec[16:9]),
    .spi_mode(in_vec[8:1]),
    .sig_R0W1(in_vec[0:0]),
    .spi_mosi(out_vec[8:8]),
    .read_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h44891;
    stim[1] = 20'hf1c85;
    stim[2] = 20'h1f9fc;
    stim[3] = 20'h3a76a;
    stim[4] = 20'h953f1;
    stim[5] = 20'h3c4db;
    stim[6] = 20'h0494c;
    stim[7] = 20'ha4933;
    stim[8] = 20'h063d6;
    stim[9] = 20'h2bf81;
    stim[10] = 20'h2da9a;
    stim[11] = 20'h2da8b;
    stim[12] = 20'h117a3;
    stim[13] = 20'h8de9d;
    stim[14] = 20'hac362;
    stim[15] = 20'hb3aa5;
    stim[16] = 20'h910ce;
    stim[17] = 20'h8be37;
    stim[18] = 20'h3daa7;
    stim[19] = 20'hb6c27;
    stim[20] = 20'hf9c0e;
    stim[21] = 20'h277a7;
    stim[22] = 20'h03577;
    stim[23] = 20'h8da0d;
    stim[24] = 20'h8ba2e;
    stim[25] = 20'h387c5;
    stim[26] = 20'h9ce16;
    stim[27] = 20'h1afcf;
    stim[28] = 20'h2f75d;
    stim[29] = 20'h0e04f;
    stim[30] = 20'hce9f3;
    stim[31] = 20'h3a285;
    stim[32] = 20'h125b7;
    stim[33] = 20'h99dc4;
    stim[34] = 20'h89795;
    stim[35] = 20'h34413;
    stim[36] = 20'h98705;
    stim[37] = 20'h3a25a;
    stim[38] = 20'h371d7;
    stim[39] = 20'h325c0;
    stim[40] = 20'h1cf2f;
    stim[41] = 20'ha0897;
    stim[42] = 20'ha7ab0;
    stim[43] = 20'h944de;
    stim[44] = 20'h3f1c7;
    stim[45] = 20'hb208d;
    stim[46] = 20'h05f80;
    stim[47] = 20'h1a316;
    stim[48] = 20'h39c6b;
    stim[49] = 20'hab07c;
    stim[50] = 20'hb973f;
    stim[51] = 20'h862d6;
    stim[52] = 20'h34c13;
    stim[53] = 20'ha5434;
    stim[54] = 20'h1b670;
    stim[55] = 20'he65cc;
    stim[56] = 20'hb88c6;
    stim[57] = 20'h320f4;
    stim[58] = 20'h294f1;
    stim[59] = 20'h11d95;
    stim[60] = 20'h185f8;
    stim[61] = 20'ha4dd1;
    stim[62] = 20'h17c1a;
    stim[63] = 20'h2ee18;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h100;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h100;
      expv[10] = 9'h100;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h100;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h100;
      expv[27] = 9'h000;
      expv[28] = 9'h100;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h100;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h100;
      expv[40] = 9'h100;
      expv[41] = 9'h100;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h100;
      expv[46] = 9'h000;
      expv[47] = 9'h100;
      expv[48] = 9'h000;
      expv[49] = 9'h100;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h100;
      expv[60] = 9'h000;
      expv[61] = 9'h100;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
