// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 56;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03919 dut (
    .Din(in_vec[55:0]),
    .Dout(out_vec[55:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'h72b8a49319c6b9;
    stim[1] = 56'hc0205f0e136ba8;
    stim[2] = 56'hd9726a7c6fea73;
    stim[3] = 56'h206b2a693d2dce;
    stim[4] = 56'hdf838dcdd0e435;
    stim[5] = 56'h9563e3fbade33d;
    stim[6] = 56'h77dc9ddf357490;
    stim[7] = 56'ha6b55671331b4a;
    stim[8] = 56'h326b9b0ccd499e;
    stim[9] = 56'hf0921e28a9d4d7;
    stim[10] = 56'h19027ce5f7938c;
    stim[11] = 56'h87d5546ddb32b9;
    stim[12] = 56'hc84658bb5442c0;
    stim[13] = 56'h69a2273db3bfba;
    stim[14] = 56'hacb345c9678049;
    stim[15] = 56'h5c7c689c8d806b;
    stim[16] = 56'h002bce0f458369;
    stim[17] = 56'h6c9a398bdf281d;
    stim[18] = 56'ha8739abfbbaec5;
    stim[19] = 56'h4b01329d3b14bf;
    stim[20] = 56'h68a8eb21937c02;
    stim[21] = 56'h991ebb58c09781;
    stim[22] = 56'hc2941871bf1487;
    stim[23] = 56'hd1fe50f1a7e465;
    stim[24] = 56'haea2d5bf09cd4d;
    stim[25] = 56'h35d81a28bb4b28;
    stim[26] = 56'h45b9d5505e4044;
    stim[27] = 56'ha65e8bc982133d;
    stim[28] = 56'h8e272169eebe54;
    stim[29] = 56'hbca6c2bf77026f;
    stim[30] = 56'h244d00d8ea96fe;
    stim[31] = 56'h5dcd8240c99328;
    stim[32] = 56'he228ad57cb0508;
    stim[33] = 56'h36699ade14bcd3;
    stim[34] = 56'h7a5f2f7cffa9dd;
    stim[35] = 56'h611aeeeaf5665b;
    stim[36] = 56'h47e0f97c5f709e;
    stim[37] = 56'h3172aa9552505c;
    stim[38] = 56'hd01c8a1d728224;
    stim[39] = 56'h58cfc675219672;
    stim[40] = 56'hf6f3de99c23d54;
    stim[41] = 56'h5525bff4fd0e64;
    stim[42] = 56'hab1ea060731a8d;
    stim[43] = 56'h423ad7c579b24c;
    stim[44] = 56'h3f9040fb780562;
    stim[45] = 56'hfad535e6423d53;
    stim[46] = 56'h9b8633db1e3088;
    stim[47] = 56'h785a414c27443a;
    stim[48] = 56'h9350535a5c7b04;
    stim[49] = 56'h03148e41f6f446;
    stim[50] = 56'hba80bd7563910c;
    stim[51] = 56'h2133f04097665e;
    stim[52] = 56'h2b8b61dc6de438;
    stim[53] = 56'heccea562099686;
    stim[54] = 56'h0f38cd2505f328;
    stim[55] = 56'hc60b342e38cab9;
    stim[56] = 56'h31786d838e8469;
    stim[57] = 56'h58ee9625b2ee4d;
    stim[58] = 56'he4c2b123142f67;
    stim[59] = 56'h281d365a5a6496;
    stim[60] = 56'h96677283bc8f21;
    stim[61] = 56'hd9eea3711001e5;
    stim[62] = 56'h95807f528ffd4c;
    stim[63] = 56'h1715cd1c00398d;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 56'hcae2925c671ae4;
      expv[1] = 56'h00817c384daea3;
      expv[2] = 56'h65c9a9f1bfa9cf;
      expv[3] = 56'h81aca984f4b73a;
      expv[4] = 56'h7e0e37374390d7;
      expv[5] = 56'h558f8feeb78cf6;
      expv[6] = 56'hdf72775cd5d243;
      expv[7] = 56'h9ad559e4cc6d28;
      expv[8] = 56'hc9ae6c0335267b;
      expv[9] = 56'hc24878b2a7535e;
      expv[10] = 56'h6409f387de4e31;
      expv[11] = 56'h1f5551a76ccae7;
      expv[12] = 56'h211962fd510b02;
      expv[13] = 56'ha6889cd6cefeeb;
      expv[14] = 56'hb2cd17259e0126;
      expv[15] = 56'h71f1a2523601af;
      expv[16] = 56'h00af380d160da7;
      expv[17] = 56'hb268e61f7ca076;
      expv[18] = 56'ha1ce6aeeeebb17;
      expv[19] = 56'h2c04ca54ec52ff;
      expv[20] = 56'ha2a3ac964df008;
      expv[21] = 56'h647aed63025e06;
      expv[22] = 56'h0a5061f6fc521c;
      expv[23] = 56'h47f943f69f9194;
      expv[24] = 56'hba8b56ec273537;
      expv[25] = 56'hd7606882ed2ca2;
      expv[26] = 56'h16e75551790110;
      expv[27] = 56'h997a2f26084cf6;
      expv[28] = 56'h389c85a7baf952;
      expv[29] = 56'hf29b0aeddc09bf;
      expv[30] = 56'h91340343aa5bfa;
      expv[31] = 56'h77360913264ca0;
      expv[32] = 56'h88a2b57f2c1421;
      expv[33] = 56'hd9a66b4852f34f;
      expv[34] = 56'he97cbdd3fea777;
      expv[35] = 56'h846bbb9bd5996e;
      expv[36] = 56'h1f83e5d17dc27b;
      expv[37] = 56'hc5caaa45494171;
      expv[38] = 56'h40722875ca0893;
      expv[39] = 56'h633f19d48659c9;
      expv[40] = 56'hdbcf7a7708f552;
      expv[41] = 56'h5496ffd3f43991;
      expv[42] = 56'hac7a81a1cc6a34;
      expv[43] = 56'h08eb5f15e6c931;
      expv[44] = 56'hfe4103cde0158a;
      expv[45] = 56'heb54d7b908f54d;
      expv[46] = 56'h6e18cf6c78c222;
      expv[47] = 56'he16905109d10eb;
      expv[48] = 56'h4d414d6971ec12;
      expv[49] = 56'h0c523907dbd118;
      expv[50] = 56'hea02f5e58e4431;
      expv[51] = 56'h84cfc1025d9978;
      expv[52] = 56'hae2d8741b790e3;
      expv[53] = 56'hb33a95b8265a18;
      expv[54] = 56'h3ce3348417cca1;
      expv[55] = 56'h182cd0b8e32ae7;
      expv[56] = 56'hc5e1b60e3a11a4;
      expv[57] = 56'h63ba5896cbb935;
      expv[58] = 56'h930ac4bc50bd9c;
      expv[59] = 56'ha074d94969925a;
      expv[60] = 56'h599dca2ef23c84;
      expv[61] = 56'h67ba8df4400794;
      expv[62] = 56'h5601fd6a3ff530;
      expv[63] = 56'h5c57344000e637;
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
