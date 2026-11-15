// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 54;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087570 dut (
    .clk(clk),
    .ra(in_vec[53:49]),
    .re(in_vec[48:48]),
    .ore(in_vec[47:47]),
    .wa(in_vec[46:42]),
    .we(in_vec[41:41]),
    .di(in_vec[40:37]),
    .byp_sel(in_vec[36:36]),
    .dbyp(in_vec[35:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 54'h1328c5de8d7418;
    stim[1] = 54'h38e0c2c5891e7c;
    stim[2] = 54'h00ba785b0cb351;
    stim[3] = 54'h256e22ba133b89;
    stim[4] = 54'h04592d117fdcdb;
    stim[5] = 54'h1c60074e79ca32;
    stim[6] = 54'h20111f4e89d997;
    stim[7] = 54'h0aa855cb1801fa;
    stim[8] = 54'h0f657121a9e51c;
    stim[9] = 54'h3af840af53650b;
    stim[10] = 54'h2575e9e3b74a39;
    stim[11] = 54'h2d14f6ab357387;
    stim[12] = 54'h126829c3557155;
    stim[13] = 54'h28a3e936dd676f;
    stim[14] = 54'h1c541037612866;
    stim[15] = 54'h0ba7bbf79995e9;
    stim[16] = 54'h3099b36af44edb;
    stim[17] = 54'h392b1224fd80b4;
    stim[18] = 54'h27b2eb597b9297;
    stim[19] = 54'h0057f087ad6db4;
    stim[20] = 54'h1ee31db36c1035;
    stim[21] = 54'h01625a28ed4cb6;
    stim[22] = 54'h031db6cd383b15;
    stim[23] = 54'h02bb72e6b8ae54;
    stim[24] = 54'h2536c8e39e926b;
    stim[25] = 54'h316be84392eea2;
    stim[26] = 54'h1489810a5edc5a;
    stim[27] = 54'h130bcf95bd0a40;
    stim[28] = 54'h14486a3a62d5aa;
    stim[29] = 54'h1b8ff18aa35c00;
    stim[30] = 54'h21c1b4018faec2;
    stim[31] = 54'h0c9a7b07c0cc3b;
    stim[32] = 54'h28100a1c5937a8;
    stim[33] = 54'h0e79e27fe373d8;
    stim[34] = 54'h365a4ac90a3197;
    stim[35] = 54'h04b72fb0b1e45f;
    stim[36] = 54'h1b4593c585f1fb;
    stim[37] = 54'h25487fbabc727e;
    stim[38] = 54'h1f72e45006db19;
    stim[39] = 54'h07eae2b3a0944c;
    stim[40] = 54'h179806f4b9f894;
    stim[41] = 54'h125554e9f4365b;
    stim[42] = 54'h30426d8649a0a6;
    stim[43] = 54'h160ced2ed8b5d2;
    stim[44] = 54'h393a6e08a55a2b;
    stim[45] = 54'h1f34e4e9cc3207;
    stim[46] = 54'h27701e5414ebdc;
    stim[47] = 54'h15c68f7e6f1d3b;
    stim[48] = 54'h2905ccd22b82b8;
    stim[49] = 54'h32fe6161d07476;
    stim[50] = 54'h3e446a3187778f;
    stim[51] = 54'h3efda149fb03e7;
    stim[52] = 54'h0d6596cf93d374;
    stim[53] = 54'h1c096bdad448c9;
    stim[54] = 54'h3176589f083990;
    stim[55] = 54'h145797ff7d5f7c;
    stim[56] = 54'h3d55c74e87c05c;
    stim[57] = 54'h2c53d2ce310e62;
    stim[58] = 54'h1b6813ecba71e0;
    stim[59] = 54'h117783ef7278db;
    stim[60] = 54'h07123122d19a6f;
    stim[61] = 54'h1e28ac222f35e0;
    stim[62] = 54'h025629939aee76;
    stim[63] = 54'h15b67de0c23885;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'h8;
      expv[4] = 4'h8;
      expv[5] = 4'h8;
      expv[6] = 4'h8;
      expv[7] = 4'h8;
      expv[8] = 4'h5;
      expv[9] = 4'h5;
      expv[10] = 4'hx;
      expv[11] = 4'hx;
      expv[12] = 4'hx;
      expv[13] = 4'hx;
      expv[14] = 4'hx;
      expv[15] = 4'hx;
      expv[16] = 4'hb;
      expv[17] = 4'h3;
      expv[18] = 4'h3;
      expv[19] = 4'hx;
      expv[20] = 4'hx;
      expv[21] = 4'hd;
      expv[22] = 4'hd;
      expv[23] = 4'hd;
      expv[24] = 4'h2;
      expv[25] = 4'h2;
      expv[26] = 4'h2;
      expv[27] = 4'hx;
      expv[28] = 4'hx;
      expv[29] = 4'hx;
      expv[30] = 4'h1;
      expv[31] = 4'h4;
      expv[32] = 4'hb;
      expv[33] = 4'hb;
      expv[34] = 4'hb;
      expv[35] = 4'hb;
      expv[36] = 4'hx;
      expv[37] = 4'hx;
      expv[38] = 4'hx;
      expv[39] = 4'hx;
      expv[40] = 4'hx;
      expv[41] = 4'hf;
      expv[42] = 4'hf;
      expv[43] = 4'hf;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hf;
      expv[47] = 4'hf;
      expv[48] = 4'hx;
      expv[49] = 4'hx;
      expv[50] = 4'hx;
      expv[51] = 4'hx;
      expv[52] = 4'hx;
      expv[53] = 4'hx;
      expv[54] = 4'hx;
      expv[55] = 4'hx;
      expv[56] = 4'hx;
      expv[57] = 4'hx;
      expv[58] = 4'hx;
      expv[59] = 4'hx;
      expv[60] = 4'hx;
      expv[61] = 4'hx;
      expv[62] = 4'hx;
      expv[63] = 4'hx;
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
