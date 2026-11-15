// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 63;
  localparam OW = 147;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10076 dut (
    .clk(clk),
    .rst(in_vec[62:62]),
    .a(in_vec[61:31]),
    .b(in_vec[30:0]),
    .adder_result(out_vec[146:115]),
    .counter(out_vec[114:99]),
    ._97bit_round(out_vec[98:2]),
    .counter_rdy(out_vec[1:1]),
    .clk_echo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 63'h766cbbe158590420;
    stim[1] = 63'h54ab9d58f41df175;
    stim[2] = 63'h3d98ffb4efb697ae;
    stim[3] = 63'h3d29dc71f3f89873;
    stim[4] = 63'h1f95c2310a94420f;
    stim[5] = 63'h15cb762fb225e1fa;
    stim[6] = 63'h235178e36d6d46c4;
    stim[7] = 63'h25657be6d889b957;
    stim[8] = 63'h39ba5b04f3abd408;
    stim[9] = 63'h0a3f38b95a063ebe;
    stim[10] = 63'h0f11dc3b95143581;
    stim[11] = 63'h2d92a5e9dc3b86ad;
    stim[12] = 63'h331583c4ecc10e0e;
    stim[13] = 63'h0b1b579cd1dd513e;
    stim[14] = 63'h3145281a22db5038;
    stim[15] = 63'h097513e80351cac1;
    stim[16] = 63'h025eb25d05e40473;
    stim[17] = 63'h2600efdc23351124;
    stim[18] = 63'h5f0738874f363b85;
    stim[19] = 63'h33cc50565c958fb0;
    stim[20] = 63'h16cc7e8760bee195;
    stim[21] = 63'h0fa3425ea539b91b;
    stim[22] = 63'h31daa44b22fd4aad;
    stim[23] = 63'h0979623af04f93da;
    stim[24] = 63'h1a37f282f28f5b57;
    stim[25] = 63'h063f06f3631b767d;
    stim[26] = 63'h34ab4df461aed4c7;
    stim[27] = 63'h17434af71a9f9c02;
    stim[28] = 63'h55dbb1a98833e447;
    stim[29] = 63'h33ce3c3d68fe0e3a;
    stim[30] = 63'h0c275c529dbf0887;
    stim[31] = 63'h21389a92b119f454;
    stim[32] = 63'h042f3be807faa75b;
    stim[33] = 63'h160494bafdfd6102;
    stim[34] = 63'h23cca2f06f38d7e1;
    stim[35] = 63'h040094e5587178d7;
    stim[36] = 63'h213d556fc49bde88;
    stim[37] = 63'h0bb3c0331c65651e;
    stim[38] = 63'h1ea3b5c063c160c0;
    stim[39] = 63'h10b71541d1a46f1a;
    stim[40] = 63'h241f716fcd625625;
    stim[41] = 63'h0f093bd0133090ee;
    stim[42] = 63'h35ef2fb767d76b80;
    stim[43] = 63'h07c8c7b9823f978a;
    stim[44] = 63'h3fbf315c48d3245f;
    stim[45] = 63'h341d1825191ef34c;
    stim[46] = 63'h3281ed80a6c27dc5;
    stim[47] = 63'h05501a34c99490c6;
    stim[48] = 63'h277eb9378c85ce17;
    stim[49] = 63'h07fd08f1a27d3a1e;
    stim[50] = 63'h14865013656fe8ec;
    stim[51] = 63'h1e27e26bda96f5bc;
    stim[52] = 63'h3b97e423d858e1cc;
    stim[53] = 63'h1fbbbdf3be72a009;
    stim[54] = 63'h0dff2d2ba6850c00;
    stim[55] = 63'h353e4faab7256eb2;
    stim[56] = 63'h19d412e8ac030dd7;
    stim[57] = 63'h12fc8aed34f3cdf7;
    stim[58] = 63'h14231da1b94b0ee3;
    stim[59] = 63'h0ee978127021f268;
    stim[60] = 63'h063fc667384fbcb3;
    stim[61] = 63'h1616fe2648a2c6fd;
    stim[62] = 63'h39fb2799ab9711e3;
    stim[63] = 63'h3126a3301073c953;
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
      expv[0] = 147'h0000000000000000000000000000000000006;
      expv[1] = 147'h0000000000000000000000000000000000006;
      expv[2] = 147'h0000000000000000000000000000000000006;
      expv[3] = 147'h0000000000008000000000000000000000008;
      expv[4] = 147'h75744b8b80010000000000000000000000010;
      expv[5] = 147'h772628ab00018000000000000000000000020;
      expv[6] = 147'h24dfe33880020000000000000000000000040;
      expv[7] = 147'h2ede672c80028000000000000000000000080;
      expv[8] = 147'h5a081c4500030000000000000000000000100;
      expv[9] = 147'h51aa589200038000000000000000000000200;
      expv[10] = 147'h7390450880040000000000000000000000400;
      expv[11] = 147'h7742581800048000000000000000000000800;
      expv[12] = 147'h199bf6fc00050000000000000000000001000;
      expv[13] = 147'h5bb0694000058000000000000000000002000;
      expv[14] = 147'h69760acb80060000000000000000000004000;
      expv[15] = 147'h740a003b80068000000000000000000008000;
      expv[16] = 147'h02b2d03600070000000000000000000010000;
      expv[17] = 147'h0b1df94880078000000000000000000020000;
      expv[18] = 147'h0000000000000000000000000000000000006;
      expv[19] = 147'h0000000000000000000000000000000000006;
      expv[20] = 147'h0000000000008000000000000000000000008;
      expv[21] = 147'h6217182e00010000000000000000000000010;
      expv[22] = 147'h072bef5180018000000000000000000000020;
      expv[23] = 147'h22401eec00020000000000000000000000040;
      expv[24] = 147'h035949a180028000000000000000000000080;
      expv[25] = 147'h01a12c2780030000000000000000000000100;
      expv[26] = 147'h137fa02e00038000000000000000000000200;
      expv[27] = 147'h77ccc23180040000000000000000000000400;
      expv[28] = 147'h0000000000000000000000000000000000006;
      expv[29] = 147'h0000000000000000000000000000000000006;
      expv[30] = 147'h0000000000008000000000000000000000008;
      expv[31] = 147'h684d435a00010000000000000000000000010;
      expv[32] = 147'h1b06e09600018000000000000000000000020;
      expv[33] = 147'h79c594bc80020000000000000000000000040;
      expv[34] = 147'h082c8f9580028000000000000000000000080;
      expv[35] = 147'h1503453b80030000000000000000000000100;
      expv[36] = 147'h5b690ee080038000000000000000000000200;
      expv[37] = 147'h7039515080040000000000000000000000400;
      expv[38] = 147'h438b44b380048000000000000000000000800;
      expv[39] = 147'h19e672c200050000000000000000000001000;
      expv[40] = 147'h1084662000058000000000000000000002000;
      expv[41] = 147'h79894cce80060000000000000000000004000;
      expv[42] = 147'h4ad09c8200068000000000000000000008000;
      expv[43] = 147'h18a1844700070000000000000000000010000;
      expv[44] = 147'h69dae57700078000000000000000000020000;
      expv[45] = 147'h08e8937e80080000000000000000000040000;
      expv[46] = 147'h6428c38b80088000000000000000000080000;
      expv[47] = 147'h00ac91cb00090000000000000000000100000;
      expv[48] = 147'h05e32c6300098000000000000000000200000;
      expv[49] = 147'h6a1a6297800a0000000000000000000400000;
      expv[50] = 147'h6dc1a043000a8000000000000000000800000;
      expv[51] = 147'h193ba600800b0000000000000000001000000;
      expv[52] = 147'h073e4489000b8000000000000000002000000;
      expv[53] = 147'h0b735d49800c0000000000000000004000000;
      expv[54] = 147'h67c45509800c8000000000000000008000000;
      expv[55] = 147'h3ef50df8000d0000000000000000010000000;
      expv[56] = 147'h2141b32b800d8000000000000000020000000;
      expv[57] = 147'h10d10703800e0000000000000000040000000;
      expv[58] = 147'h2fd599d4000e8000000000000000080000000;
      expv[59] = 147'h2d7671e8800f0000000000000000100000000;
      expv[60] = 147'h30c8a513000f8000000000000000200000000;
      expv[61] = 147'h06fa714600100000000000000000400000000;
      expv[62] = 147'h2267a4c080108000000000000000800000000;
      expv[63] = 147'h7a6861a480110000000000000001000000000;
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
