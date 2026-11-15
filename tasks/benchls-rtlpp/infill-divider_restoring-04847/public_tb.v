// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04847 dut (
    .clk_i(clk),
    .clk_en_i(in_vec[66:66]),
    .rst_i(in_vec[65:65]),
    .divide_i(in_vec[64:64]),
    .dividend_i(in_vec[63:32]),
    .divisor_i(in_vec[31:0]),
    .quotient_o(out_vec[64:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h63c1c3ae4a27dc76b;
    stim[1] = 67'h7f7fe30bf74f939c6;
    stim[2] = 67'h1d34c8a7ca8136310;
    stim[3] = 67'h03e72734a494f2a56;
    stim[4] = 67'h50c2cd187113112c5;
    stim[5] = 67'h4197b6bc40d573716;
    stim[6] = 67'h56a88918effa091cd;
    stim[7] = 67'h52bc2d7dc87257836;
    stim[8] = 67'h49cd44b631619230f;
    stim[9] = 67'h01605553ddc8719ec;
    stim[10] = 67'h1bf968d65f425a6b2;
    stim[11] = 67'h1ca16b9d80141bb05;
    stim[12] = 67'h0e66075704e429527;
    stim[13] = 67'h594a8b44a5435bf88;
    stim[14] = 67'h1243b40bc1d8cc7ce;
    stim[15] = 67'h5321af83e9cfd5e88;
    stim[16] = 67'h080711ab58159818a;
    stim[17] = 67'h0c0812ea08b1290ee;
    stim[18] = 67'h5e7715cf18c1d9696;
    stim[19] = 67'h5b303a5c514ad67fe;
    stim[20] = 67'h410edb1e7052e2195;
    stim[21] = 67'h1328e1e9c2b3378d6;
    stim[22] = 67'h0e27529344f1d16e0;
    stim[23] = 67'h071157630ad870125;
    stim[24] = 67'h4da28a3d903eb09df;
    stim[25] = 67'h5f24da395eb10dd09;
    stim[26] = 67'h0b316c71c23fa5583;
    stim[27] = 67'h5981f2d6a024c27fc;
    stim[28] = 67'h4ef827d699709a92b;
    stim[29] = 67'h1c355d7e0b88c8995;
    stim[30] = 67'h5fbc0c1640b9c3d05;
    stim[31] = 67'h48fe359d0dc015f37;
    stim[32] = 67'h4b32083df82a1ea77;
    stim[33] = 67'h505b2b6546e6c79b8;
    stim[34] = 67'h4b17efeafa6ba2995;
    stim[35] = 67'h0945d0bdf3cecb9a0;
    stim[36] = 67'h45c138cf86d5879fa;
    stim[37] = 67'h5b148bc21ed1ae48a;
    stim[38] = 67'h168d6e903e8ad7c39;
    stim[39] = 67'h10eee9fd366b2047a;
    stim[40] = 67'h4165289ccae1c6da4;
    stim[41] = 67'h0a50853b27add3a55;
    stim[42] = 67'h442f9b0cfb71548a9;
    stim[43] = 67'h00ed3a80415b5735a;
    stim[44] = 67'h068b10ce41cd22ee2;
    stim[45] = 67'h108c8faf3ebe418b3;
    stim[46] = 67'h04812bdca32d069eb;
    stim[47] = 67'h0aaea48cf07d0c639;
    stim[48] = 67'h40294ef6e5215b13c;
    stim[49] = 67'h16ef5469413953dd1;
    stim[50] = 67'h0439dda3a77a3e073;
    stim[51] = 67'h0c2c80a22816c47be;
    stim[52] = 67'h29d7d27544b738d87;
    stim[53] = 67'h1e631c01d6f00513f;
    stim[54] = 67'h056ff98f995151ed3;
    stim[55] = 67'h1a8c3194c420e219b;
    stim[56] = 67'h475fdbd4db37ca597;
    stim[57] = 67'h4498fa948ef475083;
    stim[58] = 67'h1c25758a55a5123c6;
    stim[59] = 67'h5cac5a1be716c0e8b;
    stim[60] = 67'h0682115d2314b02f3;
    stim[61] = 67'h0454fec72b30eecc0;
    stim[62] = 67'h5d962c10624846941;
    stim[63] = 67'h5a1a350e1247aa255;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000002;
      expv[58] = 65'h00000000000000006;
      expv[59] = 65'h00000000000000006;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
