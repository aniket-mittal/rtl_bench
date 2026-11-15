// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 203;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032806 dut (
    .clk(clk),
    .i_input(in_vec[202:197]),
    .A_input(in_vec[196:165]),
    .B_input(in_vec[164:133]),
    .C_input(in_vec[132:101]),
    .D_input(in_vec[100:69]),
    .Xk_plus_Ti_input(in_vec[68:37]),
    .s_input(in_vec[36:32]),
    .input_shifter_base(in_vec[31:0]),
    .int_B_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 203'h1ed1f78d33d856bc2a4b3d569488880000e420c878574e8fb37;
    stim[1] = 203'h212d4c116bb11f4ff47d98cf0f09b590e6fd12dfd59b2bb0bab;
    stim[2] = 203'h1138e3e5fb5626e30f95d5291694b674c9c240d72e021889cbd;
    stim[3] = 203'h10b70fdb5d76d42d1e2488779dab3c3720ced933f2b48a4195e;
    stim[4] = 203'h139c94565948ab5a9923a77987dd234ef5ecd9811afd0a3d7b8;
    stim[5] = 203'h3b29911c0d5ff6c854e430d33d878dbe7731b15c1e232725ca0;
    stim[6] = 203'h68f8860163ddfcb08f1aa88499afb7028368fbd3812f376402e;
    stim[7] = 203'h312fdef2685638d7a13db8b0addd22d47536a5149e72e696a30;
    stim[8] = 203'h0feca32001d68f75cafbc20f475033bd2edd2f92c3644ee83fe;
    stim[9] = 203'h0d7717572171fb2de23f86a443f254b489979518fd95961389f;
    stim[10] = 203'h5b2d6edccaca90d3ce3201fc9ff1b8189af5fc1eca170c4df1d;
    stim[11] = 203'h106ae9df9fe8f02565bd0d3a12026afb0156784fb6cdc6905ae;
    stim[12] = 203'h30bd6e208eccf80590a291ee5c41c8ffad1574cd74f7d76c50a;
    stim[13] = 203'h4b206ace511641423576b2369f152ec0de83d4a725c98ac82ba;
    stim[14] = 203'h5eaab29fc6a83edfb2ebdfa26b416bed0304f5c42b0c6964f8b;
    stim[15] = 203'h1e1384dc7d4d73f5ab86887acfad2b7d71883883196002072fe;
    stim[16] = 203'h764498c35c15fb6144d1d556e5cd41429685a6035eb487d0e14;
    stim[17] = 203'h3e70641b79d3584a8a5bba72b4b03f61e71f692ae3f795888f9;
    stim[18] = 203'h0b7536e79b292e4e5cd64c2b8b0a934cd21562c5069e50d876f;
    stim[19] = 203'h3a438623e4b9b0e8e44537900ec98ade9758154a5a4c4554380;
    stim[20] = 203'h5b874ba351694aedd7271b533dfd469cd96e96648178219466a;
    stim[21] = 203'h6fc8cc735c15b28a4d30bda3b64381147e9ab99a01ef3907929;
    stim[22] = 203'h3772751b97aca44ae24d2b207474b2b41c5355fad9fca28f892;
    stim[23] = 203'h45b343768ebb39ad13c58e890058a29a5713af06e9ae0830266;
    stim[24] = 203'h5073fcd6e69ccedaae0272374ebbed3057725b9e43baf855ea2;
    stim[25] = 203'h2ce0cb0ae90cdf293607cf96d51f3d09cc095d3db758bd0e21b;
    stim[26] = 203'h3fa1d537b1a085c07d8d8beb7132c433202c1c21cc88185a35d;
    stim[27] = 203'h538105b94437db7482723b523dd0fa523821b1d648d768ca97e;
    stim[28] = 203'h4ab8b015119e6df29fe83ec1ccc27aef63320dffa85d153e34f;
    stim[29] = 203'h3be828c54396f949a7456161240daae82925e3ec58315866ad6;
    stim[30] = 203'h57015e10f003387b50edf6da272c0be376541d8ac736a811295;
    stim[31] = 203'h7b1ddac289433774e46c82b759bb8d253d252e96ccc1759e69b;
    stim[32] = 203'h66fc73775b67f810792dc87fa83a451f194bc852afe86354ffd;
    stim[33] = 203'h4be00f0d00ec65c5d43ba38ec1bd9946bb3e4bcfe981b629e95;
    stim[34] = 203'h153a230cf204b0a89fabe022a46f730bbfebc66ffff68f9ee08;
    stim[35] = 203'h49d4beef7292763d1c4d7e8b800a7266bb4d86c86e05e9afac3;
    stim[36] = 203'h60faac842065670203df26000276de2b0a773492e45d1032a95;
    stim[37] = 203'h07fda6ca984ebc802a75db9c0e4dbaf68b18c77e62c5349f182;
    stim[38] = 203'h5701112a4fe0e3bbeab9843e7e5a21f2f9124670b4e38810d23;
    stim[39] = 203'h00565b5d1d6116b06a6aef80a5795d1a54236b5ee69ee676964;
    stim[40] = 203'h34929164eb220a38c6d9e22d20dbcae226a15a87001c4da5180;
    stim[41] = 203'h420e9f6a5f8ce297b4992b266615b885bdede1a21e3dfcfb0b3;
    stim[42] = 203'h727045ae294951574fe26d20db9953c67da8993e253621e0cd9;
    stim[43] = 203'h310dbada8e4f6bb59d573e3072aa5e5fef8cb89ebad00cd2596;
    stim[44] = 203'h6f267acfcffdbe3838559b153233870e0aa6cafb100b006f23f;
    stim[45] = 203'h5eb1638541b998b79b1196637f259371239c976b939cfc45b6d;
    stim[46] = 203'h5b53a6a7bebcbfd65693e4333ca60c3687f3c3263701d4abb03;
    stim[47] = 203'h659f17a8a0bfde2d9f07d4587c8e19444ba6eafab814884c3d3;
    stim[48] = 203'h64ea83590a20d158f3661a7c69cd5f1286633a199e79c74be14;
    stim[49] = 203'h6ac3492605157e8798c04851764d161cfa889f108aae676640f;
    stim[50] = 203'h56a9bf161a3722e4ff7c6b236529a668482172775fde036e567;
    stim[51] = 203'h0acfced1258b40f25631f27f0a82fec6229f5eed147dc811810;
    stim[52] = 203'h24c9c73ee79dabb4fcf37233cc88526936f840e168fb83f3b17;
    stim[53] = 203'h247b7c670e59b674d8642d53eeca7d44a9d93b0c88199a6d96b;
    stim[54] = 203'h558751c4b89c73a994147b7195761de16140bd093a2a6d1ebba;
    stim[55] = 203'h69f975d70880563d4fd4e525e91a9fcb01db1a7c4374452645a;
    stim[56] = 203'h1fc1777c95b416aefc9989146704c815f8a14ee0163bbdf0129;
    stim[57] = 203'h17f44e651e37b78c52b29589562836ca671fdc16de35262fe82;
    stim[58] = 203'h53e20c17d6aab07f13e97858b8283a6063cb07b9ec95ebcfd8d;
    stim[59] = 203'h3ce6cb992b104b9bbc90ed42265262e849ebf2ccd2b9b79dee5;
    stim[60] = 203'h55eeaf8d4bde8860ed336d646a62b26a73adb2dcdd4b1159ae9;
    stim[61] = 203'h556f531d75ce1949ab10a8b9f0691a36f558a62805f8e18ee9a;
    stim[62] = 203'h7dd4f308a3c31078510b5c7b4a293226bc8167ece8a570508d5;
    stim[63] = 203'h1d4247fb13dfc89a9f381d1754a2d32d1d00c94683a4b98c59a;
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
      expv[0] = 32'hd771f8d4;
      expv[1] = 32'h042f243b;
      expv[2] = 32'hf2efeafe;
      expv[3] = 32'h00843f5d;
      expv[4] = 32'hf16b7510;
      expv[5] = 32'h35e9e739;
      expv[6] = 32'h8b90a9f3;
      expv[7] = 32'hfa5b5786;
      expv[8] = 32'hf07b4b8d;
      expv[9] = 32'h20bfca15;
      expv[10] = 32'h91dc9d46;
      expv[11] = 32'h5dc2be0d;
      expv[12] = 32'h6370b036;
      expv[13] = 32'hd3f18a69;
      expv[14] = 32'hce84c8f2;
      expv[15] = 32'hb4a1f390;
      expv[16] = 32'hb0c6bf63;
      expv[17] = 32'h04858b80;
      expv[18] = 32'hcb4e52bb;
      expv[19] = 32'ha7622ac3;
      expv[20] = 32'h354fb535;
      expv[21] = 32'he8f26fe0;
      expv[22] = 32'hd32f2b24;
      expv[23] = 32'hd576e700;
      expv[24] = 32'hc69616a2;
      expv[25] = 32'h01af0519;
      expv[26] = 32'h90d3d6fb;
      expv[27] = 32'h3c2eedbe;
      expv[28] = 32'hbdb607d8;
      expv[29] = 32'h17548fcc;
      expv[30] = 32'h78789eab;
      expv[31] = 32'h96b455e9;
      expv[32] = 32'h9649d367;
      expv[33] = 32'hc1773fdf;
      expv[34] = 32'h66cb7c74;
      expv[35] = 32'h451b6291;
      expv[36] = 32'h74e2609b;
      expv[37] = 32'h715a6af5;
      expv[38] = 32'hb2bfc0c8;
      expv[39] = 32'hc6d18f27;
      expv[40] = 32'hc71b3554;
      expv[41] = 32'hba3a4f85;
      expv[42] = 32'hd22b4564;
      expv[43] = 32'h02a43a6b;
      expv[44] = 32'hb9b4f7f2;
      expv[45] = 32'h76a7f463;
      expv[46] = 32'h2f50d38b;
      expv[47] = 32'h9e1ca1e9;
      expv[48] = 32'hbaa5bb21;
      expv[49] = 32'hca9a3553;
      expv[50] = 32'hce738653;
      expv[51] = 32'h10ad9007;
      expv[52] = 32'h63a889c8;
      expv[53] = 32'hedc705d0;
      expv[54] = 32'hda81e36f;
      expv[55] = 32'h186ca781;
      expv[56] = 32'ha8451fb9;
      expv[57] = 32'h56dcdff6;
      expv[58] = 32'h5b71caa2;
      expv[59] = 32'hbfe67b6c;
      expv[60] = 32'hb8158e44;
      expv[61] = 32'hc6f5e7de;
      expv[62] = 32'h9a77828d;
      expv[63] = 32'h42daa640;
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
