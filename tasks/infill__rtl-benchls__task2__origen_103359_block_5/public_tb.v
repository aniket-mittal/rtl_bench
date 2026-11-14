// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103359 dut (
    .clk_sys(clk),
    .clk_vid(in_vec[49:49]),
    .ce_pix(in_vec[48:48]),
    .gamma_en(in_vec[47:47]),
    .gamma_wr(in_vec[46:46]),
    .gamma_wr_addr(in_vec[45:36]),
    .gamma_value(in_vec[35:28]),
    .RGB_in(in_vec[27:4]),
    .HSync(in_vec[3:3]),
    .VSync(in_vec[2:2]),
    .DE(in_vec[1:1]),
    .Blanking(in_vec[0:0]),
    .RGB_out(out_vec[27:4]),
    .HSync_out(out_vec[3:3]),
    .VSync_out(out_vec[2:2]),
    .DE_out(out_vec[1:1]),
    .Blanking_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h2deb2daa4753a;
    stim[1] = 50'h1c1418015b7e2;
    stim[2] = 50'h327911e878ccd;
    stim[3] = 50'h0206058375708;
    stim[4] = 50'h1a15361476731;
    stim[5] = 50'h02b02ba7614bf;
    stim[6] = 50'h21079abf0ba9d;
    stim[7] = 50'h08f26da6e6744;
    stim[8] = 50'h2e08b5e465838;
    stim[9] = 50'h1ec873993af07;
    stim[10] = 50'h1021820350caf;
    stim[11] = 50'h00c31744c9f8b;
    stim[12] = 50'h275383349045b;
    stim[13] = 50'h296cedf7eb5ba;
    stim[14] = 50'h08e0e77cea888;
    stim[15] = 50'h0515082c9a72f;
    stim[16] = 50'h133d16a587e9e;
    stim[17] = 50'h25d698a9b3c21;
    stim[18] = 50'h3810ef9f3267d;
    stim[19] = 50'h210300c180e68;
    stim[20] = 50'h30d51a32f1be4;
    stim[21] = 50'h0fd901da8421b;
    stim[22] = 50'h0257843b2dbc6;
    stim[23] = 50'h2e6b4e8bab1ad;
    stim[24] = 50'h2319fb3960b45;
    stim[25] = 50'h1f9169f98ce09;
    stim[26] = 50'h2cc2b475bf901;
    stim[27] = 50'h05a63885ff1b8;
    stim[28] = 50'h0e5e21e767ed5;
    stim[29] = 50'h2386ea4a32bc1;
    stim[30] = 50'h1114e2314aeba;
    stim[31] = 50'h3375da6b7e9f8;
    stim[32] = 50'h2f28b38b4bf4c;
    stim[33] = 50'h308a7a9afd537;
    stim[34] = 50'h2cf7d65dce562;
    stim[35] = 50'h2116e1a147d2c;
    stim[36] = 50'h3a2a485b030d1;
    stim[37] = 50'h2ab5ad8bf7e80;
    stim[38] = 50'h1a61169c74bbf;
    stim[39] = 50'h33d08a8023a6c;
    stim[40] = 50'h07e0a400a63a4;
    stim[41] = 50'h06ae7663fc874;
    stim[42] = 50'h07fc4c9fc7315;
    stim[43] = 50'h1bde1d653a621;
    stim[44] = 50'h15832ef284177;
    stim[45] = 50'h14270974f81c4;
    stim[46] = 50'h3ad3e99ac7ed1;
    stim[47] = 50'h1dee7efab216c;
    stim[48] = 50'h014fdbf5ce016;
    stim[49] = 50'h2b7eaf670c5f5;
    stim[50] = 50'h23859626da392;
    stim[51] = 50'h14c8d30a8b33d;
    stim[52] = 50'h22b77f50483e2;
    stim[53] = 50'h0f43e9caf16fd;
    stim[54] = 50'h123950cdce334;
    stim[55] = 50'h2a881dae0be79;
    stim[56] = 50'h33037eb17b442;
    stim[57] = 50'h3237b5232a967;
    stim[58] = 50'h24c32bf755e19;
    stim[59] = 50'h0886ec0691d35;
    stim[60] = 50'h344bfafca41a6;
    stim[61] = 50'h3f6e7e8b9108e;
    stim[62] = 50'h2848627af2b8a;
    stim[63] = 50'h04f91bf5e3568;
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
      expv[0] = 28'hxxxxxxx;
      expv[1] = 28'hxxxxxxx;
      expv[2] = 28'hxxxxxxx;
      expv[3] = 28'hxxxxxxx;
      expv[4] = 28'hxxxxxxx;
      expv[5] = 28'hxxxxxxx;
      expv[6] = 28'hxxxxxxx;
      expv[7] = 28'hxxxxxxx;
      expv[8] = 28'hxxxxxxx;
      expv[9] = 28'hxxxxxxx;
      expv[10] = 28'hxxxxxxx;
      expv[11] = 28'hxxxxxxx;
      expv[12] = 28'hxxxxxxx;
      expv[13] = 28'hxxxxxxx;
      expv[14] = 28'hxxxxxxx;
      expv[15] = 28'hxxxxxxx;
      expv[16] = 28'hxxxxxxx;
      expv[17] = 28'hxxxxxxx;
      expv[18] = 28'hxxxxxxx;
      expv[19] = 28'hxxxxxxx;
      expv[20] = 28'hxxxxxxx;
      expv[21] = 28'hxxxxxxx;
      expv[22] = 28'hxxxxxxx;
      expv[23] = 28'hxxxxxxx;
      expv[24] = 28'hxxxxxxx;
      expv[25] = 28'hxxxxxxx;
      expv[26] = 28'hxxxxxxx;
      expv[27] = 28'hxxxxxxx;
      expv[28] = 28'hxxxxxxx;
      expv[29] = 28'hxxxxxxx;
      expv[30] = 28'hxxxxxxx;
      expv[31] = 28'hxxxxxxx;
      expv[32] = 28'hxxxxxxx;
      expv[33] = 28'hxxxxxxx;
      expv[34] = 28'hxxxxxxx;
      expv[35] = 28'hxxxxxxx;
      expv[36] = 28'hxxxxxxx;
      expv[37] = 28'hxxxxxxx;
      expv[38] = 28'hxxxxxxx;
      expv[39] = 28'he878ccd;
      expv[40] = 28'he878ccd;
      expv[41] = 28'he878ccd;
      expv[42] = 28'he878ccd;
      expv[43] = 28'he878ccd;
      expv[44] = 28'he878ccd;
      expv[45] = 28'he878ccd;
      expv[46] = 28'hxx7e9f8;
      expv[47] = 28'hxx7e9f8;
      expv[48] = 28'hxx7e9f8;
      expv[49] = 28'hxx7e9f8;
      expv[50] = 28'hxx7e9f8;
      expv[51] = 28'hxx7e9f8;
      expv[52] = 28'hxx7e9f8;
      expv[53] = 28'hxx7e9f8;
      expv[54] = 28'hxx7e9f8;
      expv[55] = 28'hxx7e9f8;
      expv[56] = 28'hxx7e9f8;
      expv[57] = 28'hxx7e9f8;
      expv[58] = 28'hxx7e9f8;
      expv[59] = 28'hxx7e9f8;
      expv[60] = 28'h8023a6c;
      expv[61] = 28'h8023a6c;
      expv[62] = 28'h8023a6c;
      expv[63] = 28'h8023a6c;
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
