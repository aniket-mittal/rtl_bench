// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 128;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_107873 dut (
    .A(in_vec[127:64]),
    .B(in_vec[63:0]),
    .mult_low(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 128'h443acb358f0c32412790cd0791536bea;
    stim[1] = 128'hb517acad5a34af3023d7b7ce90113bd9;
    stim[2] = 128'h1ba432fa9e2fd20e67e7413a1eb317ca;
    stim[3] = 128'he2a20bd7040f3041e2b6eba588e8c012;
    stim[4] = 128'h9746831ffcb54b5c25228cc14d4c5ef0;
    stim[5] = 128'hed4e5b1e495eec9ee0e4fa1cefa6d086;
    stim[6] = 128'h767323f43ee6ea8e12aabd3135f0fe10;
    stim[7] = 128'h2645d39796ab44d5427a74721e9046ae;
    stim[8] = 128'h0092fc8f61e12b60ba5ce2f6072600cb;
    stim[9] = 128'h37be4a48d4f8c120aeb7b30fddcf2115;
    stim[10] = 128'h7a17625f9e59c24ba35af724b96cf182;
    stim[11] = 128'h12f5a482afda71e490ee13d07ad1778a;
    stim[12] = 128'h67d0e831ae0e85707dfed021afa5a2ee;
    stim[13] = 128'hfd0f491273aeec3d97d0ae66fb29e56b;
    stim[14] = 128'h0aaef2219fd14e8db4746183d487260e;
    stim[15] = 128'hb15aec48ed277c03b6eed1e5e199b41b;
    stim[16] = 128'h21f7a5048fd206a96fc0354186d5116e;
    stim[17] = 128'h9b36c874694d5d5691da5788e6948fa0;
    stim[18] = 128'hb4eba3f710494d7330ec3b01f24aa3fa;
    stim[19] = 128'hb3a0b061be9089df4cb8845f7b94c407;
    stim[20] = 128'haed6478abd35437d365115673fdd36d7;
    stim[21] = 128'h254d62a672fffff0c18bb61dddfb40b8;
    stim[22] = 128'haf0321b1a529306d3544355a44541eec;
    stim[23] = 128'hdd3ef3f9845bfb2f91f16493fcf72ae1;
    stim[24] = 128'h0c58bf0b0c422405440ee2d59f3bfc93;
    stim[25] = 128'hc0e3b2dedc92f409844ab87249e2b8b1;
    stim[26] = 128'h563e3fb8bcd54d4a2743f2ed978e0724;
    stim[27] = 128'h8e1a0969fbd59973188ae04dd44486d1;
    stim[28] = 128'h5d43b0d7922741056f9eeb2bd495ae34;
    stim[29] = 128'h07e6cc226488d15d614f4ed5538ca114;
    stim[30] = 128'h2ac8e90d9a73ed04fda8b73fbb6ecd58;
    stim[31] = 128'he5364fa626638d2f17f7949be773af8e;
    stim[32] = 128'h2da859f43a72891ff4fd88b23c22a021;
    stim[33] = 128'hbe7b8426397b4cfdfb27b7e130236ac9;
    stim[34] = 128'h088d36fbb43a375ef3afa55b4e4fb495;
    stim[35] = 128'hd501568c94a719e9bff9ccecaf4bdf19;
    stim[36] = 128'he7f140f9e1557c915066d8e7ceb1e761;
    stim[37] = 128'h1a5b7f64ba6dd15bdd27967950ebe1a4;
    stim[38] = 128'hf0f64ff1d62ebfddb4f22b065135c30c;
    stim[39] = 128'h933d3987a1a73c674544a27fff0897a7;
    stim[40] = 128'h6c0d57a79bb6f47b3c928e8dccdd53d0;
    stim[41] = 128'h4dbe215e9a2daaeb4ef34884b8a951f5;
    stim[42] = 128'h951547df31362455f64c6a567bf50a50;
    stim[43] = 128'h72c0129750a267fa8382ee0080a2ab37;
    stim[44] = 128'h084a04990285069c388df92f1bc58dd9;
    stim[45] = 128'ha7f429be9b42faea675b45874a70c527;
    stim[46] = 128'h1b78b46b6ab65fee896d8be3744712b6;
    stim[47] = 128'h9e900342950132f8bff6ae53d54bf6f2;
    stim[48] = 128'h340e943d19fa14429521df024e08fb00;
    stim[49] = 128'heffa212f363ff66adef1e12f402d25ed;
    stim[50] = 128'h97e1aae65c9ce8f7aefb7d065fb5ab5e;
    stim[51] = 128'h498a2ea236d57b37725c14ceb565d058;
    stim[52] = 128'h031008e3feade11e4aaf9cfd5253caeb;
    stim[53] = 128'h58ab6a9ac75bd4f1b3e0959410643de7;
    stim[54] = 128'h44baa1bc096069ca985a6597ab52ecb6;
    stim[55] = 128'h16d287a55c3f371da12a64ad80b4be90;
    stim[56] = 128'h975cb3e05c7547c7899c5970927ee94a;
    stim[57] = 128'h31248b81c3ba06cc1dbc62b7502cb729;
    stim[58] = 128'h81ce19f0a99cd8ba54f51775f10844db;
    stim[59] = 128'h3d3adf6dbb9f70036eb6e399ac16f0a8;
    stim[60] = 128'h9c56c46ed301b49708e64536a232d3b5;
    stim[61] = 128'hcb7d2d8169c029142da11e735d2ff41c;
    stim[62] = 128'h318d4ad6028dffddc359a8edfb42c88b;
    stim[63] = 128'h90850792d3a7a34f5e51411af4d47ad6;
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
      expv[0] = 64'h0233d7f0f63a1a6a;
      expv[1] = 64'he10e3b663d388fb0;
      expv[2] = 64'hbbb81930a165010c;
      expv[3] = 64'hac959c74f02a2492;
      expv[4] = 64'h3ade5aa086f26e40;
      expv[5] = 64'hf35bad3478643ab4;
      expv[6] = 64'h2e8917e656478ce0;
      expv[7] = 64'h4f35417ceb0b06c6;
      expv[8] = 64'h0aae638eadcd6520;
      expv[9] = 64'h426b202a522cf7a0;
      expv[10] = 64'h8bb5537314214516;
      expv[11] = 64'h384b8f0ef9d660e8;
      expv[12] = 64'ha6929e589320ee20;
      expv[13] = 64'h25f5ab2378344e7f;
      expv[14] = 64'he8597723ff7639b6;
      expv[15] = 64'hc01a04b787273051;
      expv[16] = 64'hffe67ca7bf4d159e;
      expv[17] = 64'h832c81d941355fc0;
      expv[18] = 64'h957b3d7ead23db4e;
      expv[19] = 64'h6a836c21b96e8119;
      expv[20] = 64'h27e7345029e10bfb;
      expv[21] = 64'h8106e384c84bf480;
      expv[22] = 64'hf8749ad1ed696a7c;
      expv[23] = 64'hd19336030a667a4f;
      expv[24] = 64'h3a47dd2f8d969adf;
      expv[25] = 64'h83149ff421f33239;
      expv[26] = 64'h1940138de827e468;
      expv[27] = 64'h0e64b8bf664078e3;
      expv[28] = 64'h47d086a85a139b04;
      expv[29] = 64'hbc2472fe8c37d844;
      expv[30] = 64'h0af03d49b05dad60;
      expv[31] = 64'h36187cfa2dd87112;
      expv[32] = 64'hd72da7ea98950cff;
      expv[33] = 64'h62a61578264734a5;
      expv[34] = 64'h97139a788ed251b6;
      expv[35] = 64'ha9a63faef2267ec1;
      expv[36] = 64'hfb266e31530c09f1;
      expv[37] = 64'ha3bedea091e4194c;
      expv[38] = 64'h9e83b60c4c17555c;
      expv[39] = 64'he4ae4f5194f12831;
      expv[40] = 64'hdb90a92ce81984f0;
      expv[41] = 64'hc478b27cbdebede7;
      expv[42] = 64'hdb2bb07f1aafac90;
      expv[43] = 64'h175fb8219a8c54b6;
      expv[44] = 64'h160f16caf172863c;
      expv[45] = 64'h1bb8b6bf9caa4ba6;
      expv[46] = 64'h96c857f52368ef34;
      expv[47] = 64'hc418cd4a48c47e70;
      expv[48] = 64'h9d4690f8efecb600;
      expv[49] = 64'h075479db48767222;
      expv[50] = 64'he8dd66a130dd87b2;
      expv[51] = 64'h3755d8e9cd320ae8;
      expv[52] = 64'h96c3176195f9528a;
      expv[53] = 64'hb5e710ad03be9277;
      expv[54] = 64'h04e5d4055cc56d9c;
      expv[55] = 64'h757f12150eda8650;
      expv[56] = 64'h13332dba4a2cde86;
      expv[57] = 64'hc070d49f3eb6eaac;
      expv[58] = 64'h378fd5dea28ecf1e;
      expv[59] = 64'hbc5559a93de651f8;
      expv[60] = 64'h7c1f4fbc6b8b23c3;
      expv[61] = 64'h4ef4582286d78e30;
      expv[62] = 64'h42109e44f8f894ff;
      expv[63] = 64'h29a0011b5b622a0a;
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
