// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056654 dut (
    .clk(clk),
    .aresetn(in_vec[98:98]),
    .s_axis_tdata(in_vec[97:82]),
    .s_axis_tvalid(in_vec[81:81]),
    .s_axis_tdata_phase(in_vec[80:65]),
    .s_axis_tvalid_phase(in_vec[64:64]),
    .cfg_data(in_vec[63:0]),
    .m_axis_tvalid(out_vec[14:14]),
    .m_axis_tdata(out_vec[13:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h2e54e2b6b680aa6dc6fd5f816;
    stim[1] = 99'h368d5ebc13ebf0121b6ece511;
    stim[2] = 99'h5de5e16f9668f898dc3136a80;
    stim[3] = 99'h58afb8e5b89009e8e38139fb1;
    stim[4] = 99'h67d81b0e03f1129dbf645a7b2;
    stim[5] = 99'h791e86523fc4147e37d6fe52b;
    stim[6] = 99'h67e4c53f3d88a27bd4a5036a5;
    stim[7] = 99'h6ac97a5b17b5c8065de6e6fa8;
    stim[8] = 99'h75462262e26a9f4f3ccf95f3f;
    stim[9] = 99'h4ebe000f7beab8404e1e0d6b4;
    stim[10] = 99'h6537c354d8e399f550b0af75f;
    stim[11] = 99'h6b64cfed18213c5c6d6cb3c92;
    stim[12] = 99'h534789bb04bb96d9b1859afef;
    stim[13] = 99'h538c872f2d59962656579c1e2;
    stim[14] = 99'h7d90f511e5995db8d16eabd9c;
    stim[15] = 99'h598c4c45774a8c872d0fe9b1d;
    stim[16] = 99'h601545cc694442537749562c3;
    stim[17] = 99'h48e7f54e6e6063cd064e8eb94;
    stim[18] = 99'h4ddef8436fca4166fbe8a2645;
    stim[19] = 99'h72eae4efd13d06b649e2d9deb;
    stim[20] = 99'h72198a56e1e8722d5b04a5ea9;
    stim[21] = 99'h57c2d6653faa85b9485c61844;
    stim[22] = 99'h69c5c060667c3c16224696304;
    stim[23] = 99'h751cdc9ae653d28a44aea6992;
    stim[24] = 99'h7429ee58b882b28db67bdc072;
    stim[25] = 99'h6915abaa0c831081d514dc649;
    stim[26] = 99'h624b76ab2d54cb57ab186af7b;
    stim[27] = 99'h731b6c12c1f79f1e2e265337d;
    stim[28] = 99'h6658227c4f5d877fe11bf1a64;
    stim[29] = 99'h5db3aeabf1176966f8b485cd5;
    stim[30] = 99'h58aa73c76ea24b27700d41ae8;
    stim[31] = 99'h43aada3a43788cfd014e11652;
    stim[32] = 99'h4c19d0cca5875a5181dd8ed8c;
    stim[33] = 99'h4ffef83d28060b5fef48e338c;
    stim[34] = 99'h5db434c7c5c7e3918c39279c6;
    stim[35] = 99'h583b3b1a00f4d0f32a40ccbd4;
    stim[36] = 99'h730d46157d889f4599d991a05;
    stim[37] = 99'h77d8faa181bdadb442c4849d0;
    stim[38] = 99'h5bf87cb9d0cd6d16bbc454180;
    stim[39] = 99'h4b57985b522d712bba4356068;
    stim[40] = 99'h7230d92258da0fbe6ad125e24;
    stim[41] = 99'h765fdd58601fb5449d20ee95c;
    stim[42] = 99'h70b9697b813e10c6ba6c6c64e;
    stim[43] = 99'h3bc1bee7e5aae2520b2c468a4;
    stim[44] = 99'h48d488cec9e8a1deff6bc500e;
    stim[45] = 99'h685d1a3a75ee231a4f55bc4f1;
    stim[46] = 99'h746106fe59246ac0f83eeae5b;
    stim[47] = 99'h1384b7b586778af6be8208cd9;
    stim[48] = 99'h71eb23121ebd5b80fe0eaf17f;
    stim[49] = 99'h5c87999578d36521d875e2602;
    stim[50] = 99'h77e6facaeeb2824908004134e;
    stim[51] = 99'h791bb30680c9e52e186c00239;
    stim[52] = 99'h6b9e373b1d5ef0eb309d913ff;
    stim[53] = 99'h54903ebf66b124bc34a760808;
    stim[54] = 99'h5ca041c3ce9b7c860f9073676;
    stim[55] = 99'h5146b327a45fb04be98825953;
    stim[56] = 99'h6b7a21771a6fe4aae7e26c008;
    stim[57] = 99'h62bbc28298f036f199eac408e;
    stim[58] = 99'h44c9b62ace8b47751b3d5becd;
    stim[59] = 99'h6a843b31b5f9d3686ad11adc5;
    stim[60] = 99'h4104e853c95d95494e2ddfe09;
    stim[61] = 99'h58e8042f9f19f6935cfdb7730;
    stim[62] = 99'h7fba62778d89c5cde4aec8435;
    stim[63] = 99'h520c959165c759a188482923e;
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
      expv[0] = 15'h4000;
      expv[1] = 15'h4000;
      expv[2] = 15'h4000;
      expv[3] = 15'h5de5;
      expv[4] = 15'h58af;
      expv[5] = 15'h4e34;
      expv[6] = 15'h7fff;
      expv[7] = 15'h7fff;
      expv[8] = 15'h7fff;
      expv[9] = 15'h7fff;
      expv[10] = 15'h7fff;
      expv[11] = 15'h7fff;
      expv[12] = 15'h7fff;
      expv[13] = 15'h6c38;
      expv[14] = 15'h6c38;
      expv[15] = 15'h7fb4;
      expv[16] = 15'h7fb4;
      expv[17] = 15'h7fb4;
      expv[18] = 15'h4b98;
      expv[19] = 15'h4b98;
      expv[20] = 15'h4b98;
      expv[21] = 15'h4b98;
      expv[22] = 15'h4b98;
      expv[23] = 15'h4b98;
      expv[24] = 15'h4b98;
      expv[25] = 15'h6343;
      expv[26] = 15'h726a;
      expv[27] = 15'h726a;
      expv[28] = 15'h726a;
      expv[29] = 15'h726a;
      expv[30] = 15'h726a;
      expv[31] = 15'h726a;
      expv[32] = 15'h726a;
      expv[33] = 15'h469d;
      expv[34] = 15'h469d;
      expv[35] = 15'h469d;
      expv[36] = 15'h469d;
      expv[37] = 15'h469d;
      expv[38] = 15'h469d;
      expv[39] = 15'h5bf8;
      expv[40] = 15'h4b57;
      expv[41] = 15'h4b57;
      expv[42] = 15'h4b57;
      expv[43] = 15'h4000;
      expv[44] = 15'h4000;
      expv[45] = 15'h48d4;
      expv[46] = 15'h48d4;
      expv[47] = 15'h4000;
      expv[48] = 15'h4000;
      expv[49] = 15'h71eb;
      expv[50] = 15'h71eb;
      expv[51] = 15'h7fff;
      expv[52] = 15'h7fff;
      expv[53] = 15'h7fff;
      expv[54] = 15'h7fff;
      expv[55] = 15'h7fff;
      expv[56] = 15'h7fff;
      expv[57] = 15'h664f;
      expv[58] = 15'h664f;
      expv[59] = 15'h664f;
      expv[60] = 15'h664f;
      expv[61] = 15'h664f;
      expv[62] = 15'h664f;
      expv[63] = 15'h7fba;
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
