// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 48;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10510 dut (
    .clk(clk),
    .api_wr(in_vec[47:47]),
    .api_addr(in_vec[46:39]),
    .api_wr_data(in_vec[38:7]),
    .internal_addr(in_vec[6:0]),
    .api_rd_data(out_vec[95:64]),
    .internal_rd_data(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 48'h12e7535d9cc0;
    stim[1] = 48'hdfef848cb982;
    stim[2] = 48'h3981a081478a;
    stim[3] = 48'h342f6da5668f;
    stim[4] = 48'h93666029bd1c;
    stim[5] = 48'hdc3dc8486d2e;
    stim[6] = 48'h3a6b457d3a89;
    stim[7] = 48'h99ae8fc778d9;
    stim[8] = 48'h723e9ec0c769;
    stim[9] = 48'h27bf2b466f9d;
    stim[10] = 48'h6432d011c6fe;
    stim[11] = 48'h66453534d812;
    stim[12] = 48'h9c6f4d8a0136;
    stim[13] = 48'he896b7e76bb9;
    stim[14] = 48'h0d22003de1ab;
    stim[15] = 48'hc9c53aad56af;
    stim[16] = 48'h27d1c5e8883b;
    stim[17] = 48'h3342fb0b6a24;
    stim[18] = 48'h55381824c2ce;
    stim[19] = 48'h3aac96a3b778;
    stim[20] = 48'hba226664df0d;
    stim[21] = 48'h385e99a44904;
    stim[22] = 48'h28d035f5393a;
    stim[23] = 48'hf4c7bed467f6;
    stim[24] = 48'h91db772869a5;
    stim[25] = 48'h7c2532ccacf1;
    stim[26] = 48'h9dc36313e515;
    stim[27] = 48'h466ffd2317f6;
    stim[28] = 48'he47adf463960;
    stim[29] = 48'hc33a9bd2940b;
    stim[30] = 48'h9fce8e9f3912;
    stim[31] = 48'h17640551b03e;
    stim[32] = 48'hb4b460af2a5f;
    stim[33] = 48'h36cba87ce9fd;
    stim[34] = 48'h742b4f433ebe;
    stim[35] = 48'h03c23af3274e;
    stim[36] = 48'h1f6d09a6df30;
    stim[37] = 48'h43dfc3480937;
    stim[38] = 48'h516dac208e35;
    stim[39] = 48'hd783fd909056;
    stim[40] = 48'he76df6800331;
    stim[41] = 48'he27747205864;
    stim[42] = 48'hc97bb4efcd66;
    stim[43] = 48'h30fa37bed5e6;
    stim[44] = 48'hc19087b63254;
    stim[45] = 48'h2d8b952470e8;
    stim[46] = 48'h111d705aabc1;
    stim[47] = 48'h24cf7f4dc50b;
    stim[48] = 48'h8823469c289d;
    stim[49] = 48'h7aa7ddcc87a0;
    stim[50] = 48'h66589cdfb50d;
    stim[51] = 48'ha9d643e8d184;
    stim[52] = 48'h9e2df153d469;
    stim[53] = 48'hc8edcccd081f;
    stim[54] = 48'he6ce0abf4a34;
    stim[55] = 48'h95c835595fed;
    stim[56] = 48'hcb8626e5b900;
    stim[57] = 48'h70452314d990;
    stim[58] = 48'h77bb0f3fd41d;
    stim[59] = 48'h3019aba8dea4;
    stim[60] = 48'h62ca945c7619;
    stim[61] = 48'h5c8a88dedbf2;
    stim[62] = 48'h2af380a4b83d;
    stim[63] = 48'hbbe4ac5cd4b0;
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
      expv[0] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 96'hxxxxxxxxxxxxxxxx44ccc9be;
      expv[24] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[31] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[32] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[33] = 96'hxxxxxxxxdf091973xxxxxxxx;
      expv[34] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[35] = 96'h8f7da8cfxxxxxxxxxxxxxxxx;
      expv[36] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[37] = 96'h9d1d3e72xxxxxxxxxxxxxxxx;
      expv[38] = 96'h7537a528xxxxxxxxxxxxxxxx;
      expv[39] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[40] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[41] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[42] = 96'hxxxxxxxxxxxxxxxxf5be8c72;
      expv[43] = 96'h8a755aadxxxxxxxxxxxxxxxx;
      expv[44] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[45] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[46] = 96'hxxxxxxxx2d6fced7xxxxxxxx;
      expv[47] = 96'hb6ee50d3210f6c64xxxxxxxx;
      expv[48] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[49] = 96'hxxxxxxxx86c627caxxxxxxxx;
      expv[50] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[51] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[52] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[53] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[54] = 96'hxxxxxxxx9d1d3e72xxxxxxxx;
      expv[55] = 96'hxxxxxxxx68c15e54xxxxxxxx;
      expv[56] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[57] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[58] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[59] = 96'hxxxxxxxx86c627caxxxxxxxx;
      expv[60] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[61] = 96'hxxxxxxxx5d1f8ef1xxxxxxxx;
      expv[62] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[63] = 96'hxxxxxxxxxxxxxxxxxxxxxxxx;
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
