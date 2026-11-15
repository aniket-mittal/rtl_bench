// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01405 dut (
    .CLK(clk),
    .process_CE(in_vec[96:96]),
    .inp(in_vec[95:0]),
    .process_output(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h16d72e0ff57672ba27e33ac4d;
    stim[1] = 97'h1a5a8799da41cab422cf8e753;
    stim[2] = 97'h10e57080fd49924b4cff8ed59;
    stim[3] = 97'h0b3f0ebcef74d6e708ea1276e;
    stim[4] = 97'h04e6e3696c6a3085e6c1a28f8;
    stim[5] = 97'h16f3b55c01f6dde1ef3be9912;
    stim[6] = 97'h132cef5589c27791204b47d29;
    stim[7] = 97'h0e48782bdaebd85930b27a14d;
    stim[8] = 97'h017d6ae498591f1336e407cf3;
    stim[9] = 97'h15d6b749016e29e5e99417447;
    stim[10] = 97'h022c5c51299bdb742e10ab626;
    stim[11] = 97'h0a5a42b27a8aca77246d922fc;
    stim[12] = 97'h156ae9db60c68390cd6e06b50;
    stim[13] = 97'h1cb6d05665b0fe94755bc56af;
    stim[14] = 97'h1fef0733dee708d1a1734adaf;
    stim[15] = 97'h0a3316d03243c9e452c535c2b;
    stim[16] = 97'h0241871f3cb099c352df43fc0;
    stim[17] = 97'h063e4caeb1b177785348966c4;
    stim[18] = 97'h0b8c25d754ad07fffeab75cc1;
    stim[19] = 97'h11f0039c498bd147301478f4b;
    stim[20] = 97'h10bf09008fddd6b11547cb4c5;
    stim[21] = 97'h058fb73355fe9d2857eb6917b;
    stim[22] = 97'h18550b6e4d448110f4f673360;
    stim[23] = 97'h1c97c55bbad9754e57521dd1f;
    stim[24] = 97'h1fe08d499b3175afe2f155044;
    stim[25] = 97'h07090292b87176bceaf98fc66;
    stim[26] = 97'h13c37db8c4b8bface3d1072f8;
    stim[27] = 97'h18ec36b2dbd4b17f157f72a22;
    stim[28] = 97'h057dcce76647c7345450b7e95;
    stim[29] = 97'h1b6bf7802f0f7532fc4037683;
    stim[30] = 97'h1302bc7104899461ba1efdf5e;
    stim[31] = 97'h108e1bba32166ba861a4ef625;
    stim[32] = 97'h02f1dccac53c5e317210b4994;
    stim[33] = 97'h1b2443050eb97541cf7152720;
    stim[34] = 97'h188d549c6278a0a751b89cb97;
    stim[35] = 97'h05c1c9f2affe3de5701b12f64;
    stim[36] = 97'h0ab18bd7094e29854caaec1f6;
    stim[37] = 97'h0d7083a4de8a3715613b36fcf;
    stim[38] = 97'h0064ea4a69bc0f702f0a97e73;
    stim[39] = 97'h078d58803542b839ec8109fd4;
    stim[40] = 97'h11ec149003745919dcf0d3939;
    stim[41] = 97'h06fedbe80b92e793449de6e79;
    stim[42] = 97'h07fd452042c0a599ef87f75b5;
    stim[43] = 97'h17de1e1ac82112494721d0b05;
    stim[44] = 97'h0b25417e9a39d725dfb9413dc;
    stim[45] = 97'h173e4d4d280ee2d0586f74160;
    stim[46] = 97'h07c331861bf3da86af19c22c1;
    stim[47] = 97'h08c4f9d50a446674f507c2df7;
    stim[48] = 97'h01a03290babd61d9e8eb8b84f;
    stim[49] = 97'h0c7f2a187b853a3e325a30478;
    stim[50] = 97'h0e37544a44c324764919bcc8c;
    stim[51] = 97'h012e265c6e798092ab5e74964;
    stim[52] = 97'h132f75708f33e88649e5bf260;
    stim[53] = 97'h160eee35de0bce69b17e76fb8;
    stim[54] = 97'h0b1fc5ce3e787de4ed0fdf1c8;
    stim[55] = 97'h09d6bccbfa23105d68a123cf0;
    stim[56] = 97'h04157951249eb78243aac80a5;
    stim[57] = 97'h12a1ca9e05710bbae547d3eed;
    stim[58] = 97'h1da88dd1371eab979ccf06838;
    stim[59] = 97'h044601137ab601e8f8de9a6c8;
    stim[60] = 97'h1a9d4c7dd9fbaf88a5f9f17c2;
    stim[61] = 97'h0e0f5caed0478296a7f0c5bbe;
    stim[62] = 97'h06b3aeb6ed757019dfb3b039b;
    stim[63] = 97'h13e7e0fa87bceb8689a673023;
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
      expv[0] = 64'h57672ba27e33ac4d;
      expv[1] = 64'ha41cab422cf8e753;
      expv[2] = 64'hd49924b4cff8ed59;
      expv[3] = 64'hf74d6e708ea1276e;
      expv[4] = 64'hc6a3085e6c1a28f8;
      expv[5] = 64'h1f6dde1ef3be9912;
      expv[6] = 64'h9c27791204b47d29;
      expv[7] = 64'haebd85930b27a14d;
      expv[8] = 64'h8591f1336e407cf3;
      expv[9] = 64'h16e29e5e99417447;
      expv[10] = 64'h99bdb742e10ab626;
      expv[11] = 64'ha8aca77246d922fc;
      expv[12] = 64'h0c68390cd6e06b50;
      expv[13] = 64'h5b0fe94755bc56af;
      expv[14] = 64'hee708d1a1734adaf;
      expv[15] = 64'h243c9e452c535c2b;
      expv[16] = 64'hcb099c352df43fc0;
      expv[17] = 64'h1b177785348966c4;
      expv[18] = 64'h4ad07fffeab75cc1;
      expv[19] = 64'h98bd147301478f4b;
      expv[20] = 64'hfddd6b11547cb4c5;
      expv[21] = 64'h5fe9d2857eb6917b;
      expv[22] = 64'hd448110f4f673360;
      expv[23] = 64'had9754e57521dd1f;
      expv[24] = 64'hb3175afe2f155044;
      expv[25] = 64'h87176bceaf98fc66;
      expv[26] = 64'h4b8bface3d1072f8;
      expv[27] = 64'hbd4b17f157f72a22;
      expv[28] = 64'h647c7345450b7e95;
      expv[29] = 64'hf0f7532fc4037683;
      expv[30] = 64'h4899461ba1efdf5e;
      expv[31] = 64'h2166ba861a4ef625;
      expv[32] = 64'h53c5e317210b4994;
      expv[33] = 64'heb97541cf7152720;
      expv[34] = 64'h278a0a751b89cb97;
      expv[35] = 64'hffe3de5701b12f64;
      expv[36] = 64'h94e29854caaec1f6;
      expv[37] = 64'he8a3715613b36fcf;
      expv[38] = 64'h9bc0f702f0a97e73;
      expv[39] = 64'h542b839ec8109fd4;
      expv[40] = 64'h3745919dcf0d3939;
      expv[41] = 64'hb92e793449de6e79;
      expv[42] = 64'h2c0a599ef87f75b5;
      expv[43] = 64'h82112494721d0b05;
      expv[44] = 64'ha39d725dfb9413dc;
      expv[45] = 64'h80ee2d0586f74160;
      expv[46] = 64'hbf3da86af19c22c1;
      expv[47] = 64'ha446674f507c2df7;
      expv[48] = 64'habd61d9e8eb8b84f;
      expv[49] = 64'hb853a3e325a30478;
      expv[50] = 64'h4c324764919bcc8c;
      expv[51] = 64'he798092ab5e74964;
      expv[52] = 64'hf33e88649e5bf260;
      expv[53] = 64'he0bce69b17e76fb8;
      expv[54] = 64'he787de4ed0fdf1c8;
      expv[55] = 64'ha23105d68a123cf0;
      expv[56] = 64'h49eb78243aac80a5;
      expv[57] = 64'h5710bbae547d3eed;
      expv[58] = 64'h71eab979ccf06838;
      expv[59] = 64'hab601e8f8de9a6c8;
      expv[60] = 64'h9fbaf88a5f9f17c2;
      expv[61] = 64'h0478296a7f0c5bbe;
      expv[62] = 64'hd757019dfb3b039b;
      expv[63] = 64'h7bceb8689a673023;
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
